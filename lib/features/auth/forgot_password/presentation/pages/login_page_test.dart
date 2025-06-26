import 'dart:ui';

import 'package:fitness/core/app_colors/colors.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/send_email_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/fade_transition.dart';
import 'package:flutter/material.dart';

class LoginPageTest extends StatelessWidget {
  const LoginPageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backGround_image.png',
            fit: BoxFit.cover,
          ),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              color: Colors.black.withOpacity(.2),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 100,
                  ),
                ),
                const SizedBox(height: 40),

                Text(
                  "welcome to Fitness",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.backgroundColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).push(createFadeRoute(const EmailPage()));

                  }, child: Text("lets go ")),
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
