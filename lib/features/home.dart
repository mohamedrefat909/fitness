import 'package:flutter/material.dart';
import 'package:fitness/core/routes_manager/routes_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.bottomNavBar);
            },
            child: const Text('Ok'),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
