import 'package:fitness/core/routes_manager/routes_name.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/login_page_test.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/otp_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/send_email_page.dart';
import 'package:fitness/features/home.dart';
import 'package:flutter/material.dart';

import '../../features/measurments/body_measures.dart';
import '../../features/measurments/measure_page_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: settings,
        );
        case RoutesName.sendEmail:
        return MaterialPageRoute(
          builder: (context) => EmailPage(),
          settings: settings,
        );
        case RoutesName.otp:
        return MaterialPageRoute(
          builder: (context) => OtpPage(),
          settings: settings,
        );
        case RoutesName.resetPassword:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordPage(),
          settings: settings,
        );
        case RoutesName.loginTest:
        return MaterialPageRoute(
          builder: (context) => LoginPageTest(),
          settings: settings,
        );
      case RoutesName.registerAge:
        return MaterialPageRoute(
          builder: (context) => MeasurePageView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPageTest(),
          settings: settings,
        );
    }
  }
}
