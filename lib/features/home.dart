import 'package:fitness/core/routes_manager/routes_name.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(),
          ),
          ElevatedButton(onPressed: (){
Navigator.pushNamed(context, RoutesName.bottomNavBar);
          }, child: Text('Ok'))
        ],
      ),
    );
  }
}