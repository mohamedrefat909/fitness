import 'package:fitness/core/routes_manager/routes_name.dart';
import 'package:fitness/features/app/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:fitness/features/app/splash/presentation/pages/splash_screen.dart';
import 'package:fitness/features/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: settings,
        );
        case RoutesName.splash:
          return MaterialPageRoute(
            builder: (context) => SplashScreen(),
          );
      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );
    }
  }
}
