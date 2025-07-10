import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fitness/core/app_colors/colors.dart';
import 'package:pinput/pinput.dart';

class BlurredTextFieldContainer extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final String bottomText;
  final VoidCallback? onTap;
  final bool hasSecondField;
  final String? secondHintText;
  final IconData? secondPrefixIcon;
  final TextEditingController controller;
  final TextEditingController? secondController;
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final bool isLoading;
  final Widget? extraWidget;  // <-- الخاصية الجديدة

  const BlurredTextFieldContainer({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.bottomText,
    this.onTap,
    this.hasSecondField = false,
    this.secondHintText,
    this.secondPrefixIcon,
    required this.controller,
    this.secondController,
    this.emailValidator,
    this.passwordValidator,
    this.isLoading = false,
    this.extraWidget,   // <-- إضافتها هنا
  });

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
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                validator: emailValidator ??
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ${hintText.toLowerCase()}';
                      }
                      return null;
                    },
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: AppColors.lightGrey),
                  prefixIcon: Icon(prefixIcon, color: AppColors.lightGrey),
                  filled: true,
                  fillColor: AppColors.backgroundColor.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              if (hasSecondField && secondController != null) ...[
                const SizedBox(height: 15),
                TextFormField(
                  controller: secondController,
                  validator: passwordValidator ??
                          (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ${secondHintText?.toLowerCase() ?? 'the second value'}';
                        }
                        return null;
                      },
                  decoration: InputDecoration(
                    hintText: secondHintText ?? '',
                    hintStyle: const TextStyle(color: AppColors.lightGrey),
                    prefixIcon: Icon(
                      secondPrefixIcon ?? Icons.lock,
                      color: AppColors.lightGrey,
                    ),
                    filled: true,
                    fillColor: AppColors.backgroundColor.withOpacity(0.05),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: onTap == null || isLoading
                      ? null
                      : onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: onTap == null || isLoading
                        ? AppColors.primaryColor.withOpacity(0.5)
                        : AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : Text(
                    bottomText,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),

              // إضافة extraWidget هنا لو موجودة
              if (extraWidget != null) ...[
                const SizedBox(height: 20),
                extraWidget!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class OtpTextFieldContainer extends StatelessWidget {
  final void Function(String)? onCompleted;
  final VoidCallback? onResendTap;
  final TextEditingController? controller;
  final VoidCallback onTapBottom;

  const OtpTextFieldContainer({
    super.key,
    this.onCompleted,
    this.onResendTap,
    this.controller,
    required this.onTapBottom,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 24, color: Colors.grey),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 2)),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      textStyle: const TextStyle(
        fontSize: 24,
        color: Colors.deepOrange,
        fontWeight: FontWeight.bold,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.deepOrange, width: 2)),
      ),
    );

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
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Enter Your OTP - Check Your Email",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 24),
              Pinput(
                controller: controller,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                submittedPinTheme: submittedPinTheme,
                focusedPinTheme: focusedPinTheme,
                validator: (value) {
                  if (value == null || value.length != 6) {
                    return 'Please enter the 6-digit code';
                  }
                  return null;
                },
                onCompleted: onCompleted,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: onTapBottom,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Didn’t Receive Verification Code?",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: onResendTap,
                child: Text(
                  "Resend Code?",
                  style: TextStyle(
                    color:
                        onResendTap != null ? Colors.deepOrange : Colors.grey,
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
