import 'package:flutter/material.dart';
import 'package:fitness/core/routes_manager/routes_name.dart';

// Screens
import 'package:fitness/features/auth/forgot_password/presentation/pages/otp_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/send_email_page.dart';
import 'package:fitness/features/app/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:fitness/features/app/splash/presentation/pages/splash_screen.dart';
import 'package:fitness/features/app_sections/presentation/view/app_section_view.dart';
import 'package:fitness/features/home.dart';
import 'package:fitness/features/auth/login/presentation/screens/login_screen.dart';
import 'package:fitness/features/measurments/measure_page_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RoutesName.home => _buildRoute(HomePage(), settings),
      RoutesName.sendEmail => _buildRoute(EmailPage(), settings),
      RoutesName.otp => _buildRoute(OtpPage(), settings),
      RoutesName.resetPassword => _buildRoute(ResetPasswordPage(), settings),
      RoutesName.registerAge => _buildRoute(MeasurePageView(), settings),
      RoutesName.splash => _buildRoute(SplashScreen(), settings),
      RoutesName.onboarding => _buildRoute(OnboardingScreen(), settings),
      RoutesName.bottomNavBar => _buildRoute(AppSectionView(), settings),
      _ => _buildRoute(LoginScreen(), settings), // ← default
    };
  }

  static MaterialPageRoute _buildRoute(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}
