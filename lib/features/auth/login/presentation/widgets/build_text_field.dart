import 'package:fitness/core/app_colors/colors.dart';
//import 'package:fitness/core/app_constants/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String validatorMessage;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validation;

  const BuildTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validatorMessage,
    this.validation,
    this.autovalidateMode,
  });

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: GoogleFonts.inter(
          color: AppColors.gray,
          fontWeight: FontWeight.w400,
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          color: AppColors.textField,
          fontSize: 14,
        ),
        errorText: errorText,
        errorStyle: GoogleFonts.inter(
          color:AppColors.error,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray),
        ),
      ),
      validator:widget.validation
    );
  }
}
