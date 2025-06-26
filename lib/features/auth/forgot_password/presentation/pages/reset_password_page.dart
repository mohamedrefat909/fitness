import 'package:fitness/features/auth/forgot_password/presentation/pages/login_page_test.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/base_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/blur_container.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/fade_transition.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      title: "Reset Password",
      subtitle: "Enter your new password",
      child: BlurredTextFieldContainer(
        controller: TextEditingController(),
        hintText: "New Password",
        prefixIcon: Icons.lock,
        bottomText: "Reset Password",
        onTap: () {
          Navigator.of(context).push(createFadeRoute(const LoginPageTest()));

        },
        hasSecondField: true,
        secondHintText: "Confirm Password",
        secondPrefixIcon: Icons.lock_outline,
      ),
    );
  }
}
