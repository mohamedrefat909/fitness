import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fitness/core/app_colors/colors.dart';
import 'package:pinput/pinput.dart';

class BlurredTextFieldContainer extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final String bottomText;
  final VoidCallback onTap;
  final bool hasSecondField;
  final String? secondHintText;
  final IconData? secondPrefixIcon;
  final TextEditingController controller;

  const BlurredTextFieldContainer({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.bottomText,
    required this.onTap,
    this.hasSecondField = false,
    this.secondHintText,
    this.secondPrefixIcon,
    required this.controller,
  });

  @override
  State<BlurredTextFieldContainer> createState() =>
      _BlurredTextFieldContainerState();
}

class _BlurredTextFieldContainerState extends State<BlurredTextFieldContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _secondController = TextEditingController(); // إذا حبيت تستخدمه لاحقًا

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.backgroundColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: widget.controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل ${widget.hintText.toLowerCase()}';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(color: AppColors.grey),
                    prefixIcon: Icon(widget.prefixIcon, color: AppColors.grey),
                    filled: true,
                    fillColor: AppColors.backgroundColor.withOpacity(0.05),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),

                if (widget.hasSecondField) ...[
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _secondController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل ${widget.secondHintText?.toLowerCase() ?? 'القيمة الثانية'}';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: widget.secondHintText ?? '',
                      hintStyle: const TextStyle(color: AppColors.grey),
                      prefixIcon: Icon(widget.secondPrefixIcon ?? Icons.lock,
                          color: AppColors.grey),
                      filled: true,
                      fillColor: AppColors.backgroundColor.withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onTap();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      widget.bottomText,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class OtpTextFieldContainer extends StatelessWidget {
  final VoidCallback onTap;
  final void Function(String)? onCompleted;

  const OtpTextFieldContainer({
    super.key,
    required this.onTap,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    // 🟥 الخانات الفاضية
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Colors.grey, // لون الخانة الفاضية
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );

    // 🟧 الخانات اللي تم إدخال رقم فيها
    final submittedPinTheme = defaultPinTheme.copyWith(
      textStyle: const TextStyle(
        fontSize: 24,
        color: Colors.deepOrange, // لون الرقم
        fontWeight: FontWeight.bold,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.deepOrange, width: 2),
        ),
      ),
    );

    // 🟨 الخانة اللي عليها التركيز (focus)
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.orangeAccent, width: 3),
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Enter Your OTP - Check Your Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),

              // Pinput بـ 4 خانات
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                submittedPinTheme: submittedPinTheme,
                focusedPinTheme: focusedPinTheme,
                onCompleted: onCompleted,
              ),

              const SizedBox(height: 24),

              // زر تأكيد
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Didn’t Receive Verification Code?",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),

              GestureDetector(
                onTap: () {
                  print("Resend tapped");
                },
                child: const Text(
                  "Resend Code?",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
