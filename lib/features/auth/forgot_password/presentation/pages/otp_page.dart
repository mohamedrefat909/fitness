import 'package:fitness/features/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/base_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/blur_container.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/fade_transition.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      title: "Enter Verification Code",
      subtitle: "We sent it to your email",
      child: OtpTextFieldContainer(

        onTap: () {
          Navigator.of(context).push(
              createFadeRoute(const ResetPasswordPage()));
        },
        onCompleted: (value) {
          // Handle OTP completion
        },
      ),
    );
  }
}