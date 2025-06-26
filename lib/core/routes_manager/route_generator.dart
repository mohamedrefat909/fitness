import 'package:fitness/core/routes_manager/routes_name.dart';
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
      case RoutesName.registerAge:
        return MaterialPageRoute(
          builder: (context) => MeasurePageView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );
    }
  }
}
