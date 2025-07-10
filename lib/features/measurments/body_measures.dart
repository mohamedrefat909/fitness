import 'package:fitness/core/app_colors/colors.dart';
import 'package:fitness/core/models/user_model.dart';
import 'package:fitness/features/measurments/wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/widgets/background_pic.dart';
import '../../core/widgets/custom_app_bar.dart';

class BodyMeasures extends StatelessWidget {
  const BodyMeasures({
    super.key,
    required this.index,
    required this.start,
    required this.end,
    required this.initialValue,
    required this.question,
    required this.unit,
    required this.controller,
    required this.onValueChanged,
  });

  final int index;
  final int start;

  final int end;
  final int initialValue;
  final String question;
  final String unit;
  final PageController controller;
  final void Function(int value) onValueChanged;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    
    return BackgroundPic(
      backgroundImage: 'assets/images/background.png',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            back:
                () => controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * .04,
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: CircularPercentIndicator(
                  radius: screenWidth * 0.08,
                  lineWidth: screenWidth * 0.02,
                  percent: index / 6,
                  center: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "$index/6",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),

                  backgroundColor: Colors.transparent,
                  progressColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              question,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              "this helps us create Your personalized plan",
              style: TextStyle(
                fontSize: screenWidth * 0.038,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          WheelWidget(
            onValueChanged: onValueChanged,
            initialValue: initialValue,
            maxValue: end,
            minValue: start,
            unit: unit,
            buttonText:"Next",
            //index != 4 ? "Next" : "Done",
            onTap:
                () =>
                    index == 6
                        ? {
                          print(UserModel.instance.age),
                          print(UserModel.instance.height),
                          print(UserModel.instance.weight),
                          print(UserModel.instance.gender),
                        }
                        : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
          ),
        ],
      ),
    );
  }
}
