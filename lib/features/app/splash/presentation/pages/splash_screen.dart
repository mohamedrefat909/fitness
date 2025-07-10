import 'package:fitness/core/routes_manager/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/app_constants/string_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async{
      final prefs = await SharedPreferences.getInstance();
      final onboarding = prefs.getBool(StringManager.onboardingKey) ?? false;
      if(onboarding) {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }else{
        Navigator.pushReplacementNamed(context, RoutesName.onboarding);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash_screen.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
