import 'package:flutter/cupertino.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;
  final Icon? icon;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
    this.icon,
  });

 static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: 'assets/images/on_1.png',
      title: 'The price of excellence\n is discipline',
      description:
          'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa',
    ),
    OnboardingModel(
      image: 'assets/images/on_2.png',
      title: 'Fitness has never been so much fun',
      description:
          'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa',
    ),
    OnboardingModel(
      image: 'assets/images/on_3.png',
      title: 'NO MORE EXCUSES Do It Now',
      description:
          'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa',
    ),
  ];

  static const List<Size> imageSizes = [
    Size(375, 695),
    Size(375, 516),//450
    Size(375, 516),//450
  ];
}
