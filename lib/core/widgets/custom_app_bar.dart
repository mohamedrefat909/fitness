import 'package:flutter/material.dart';

import '../app_colors/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.back});

  final void Function() back;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: back,
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
              child: Center(
                child: Icon(Icons.arrow_back, size: 25, color: Colors.white),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/logo.png"),
          ),
          Spacer(),
          CircleAvatar(radius: 20, backgroundColor: Colors.transparent),
        ],
      ),
    );
  }
}
