import 'package:fitness/core/routes_manager/routes_name.dart';
import 'package:fitness/features/home.dart';
import 'package:fitness/features/auth/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(),
          settings: settings,
        );
    }
  }
}
