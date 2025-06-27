import 'package:fitness/core/app_theme/app_theme.dart';
import 'package:fitness/core/routes_manager/route_generator.dart';
import 'package:fitness/features/app_sections/presentation/view_model/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit())
      ],
      child: MaterialApp(
        title: 'Fitness',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
