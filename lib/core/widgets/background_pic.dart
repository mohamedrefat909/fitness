import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundPic extends StatelessWidget {
  const BackgroundPic({super.key, required this.child,required this.backgroundImage});

  final Widget child;
  final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12.5, sigmaY: 12.5),
            child: Container(child:   child,),
          ),

        ],
      ),
    );
  }
}
