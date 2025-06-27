import 'package:fitness/core/models/user_model.dart';
import 'package:fitness/features/measurments/multiple_choice.dart';
import 'package:fitness/features/measurments/select_gender.dart';
import 'package:flutter/material.dart';
import 'body_measures.dart';

class MeasurePageView extends StatelessWidget {
  MeasurePageView({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    
    return PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        SelectGender(
          controller: controller,
          index: 1,
          onValueChanged: (value) => UserModel.instance.gender = value,
        ),
        BodyMeasures(
          question: "How old are you?",
          start: 10,
          end: 100,
          initialValue: 25,
          index: 2,
          unit: "years",
          controller: controller,
          onValueChanged: (int value) {
            UserModel.instance.age = value;
          },
        ),

        BodyMeasures(
          question: "What is your height?",
          start: 100,
          end: 220,
          initialValue: 170,
          index: 3,
          unit: "cm",
          controller: controller,
          onValueChanged: (int value) {
            UserModel.instance.height = value;
          },
        ),

        BodyMeasures(
          question: "What is your weight?",
          start: 30,
          end: 200,
          initialValue: 70,
          index: 4,
          unit: "kg",
          controller: controller,
          onValueChanged: (int value) {
            UserModel.instance.weight = value;
          },
        ),
        MultipleChoicePage(
          controller: controller,
          index: 5,
          question: "WHAT IS YOUR GOAL?",
          options: [
            'Gain Weight',
            'Lose Weight',
            'Get Fitter',
            'Gain More Flexible',
            'Learn The Basic',
          ],
          onSave: (val) => UserModel.instance.role = val,
        ),
        MultipleChoicePage(
          controller: controller,
          index: 6,
          question: "YOUR REGULAR PHYSICAL ACTIVITY LEVEL?",
          options: [
            'Rookie',
            'Beginner',
            'Intermediate',
            'Advance',
            'True Beast',
          ],
          onSave: (val) => UserModel.instance.role = val,
          isLast: true,
        ),
      ],
    );
  }
}
