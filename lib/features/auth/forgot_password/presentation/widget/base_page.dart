import 'dart:ui';

import 'package:flutter/material.dart';

class AuthBasePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const AuthBasePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backGround_image.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox(),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.black.withOpacity(.2),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: screenWidth * 0.5,
                      errorBuilder: (context, error, stackTrace) => const SizedBox(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 30),
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
