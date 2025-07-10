import 'package:flutter/material.dart';

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
          ElevatedButton(onPressed: (){
Navigator.pushNamed(context, RoutesName.bottomNavBar);
          }, child: Text('Ok'))
            ElevatedButton(onPressed: (){}, child: Text('Ok'))
        ],
      ),
    );
  }
}










