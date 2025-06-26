import 'dart:ui';
import 'package:fitness/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../core/app_colors/colors.dart';
import '../../core/widgets/background_pic.dart' show BackgroundPic;
import '../../core/widgets/custom_app_bar.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({
    super.key,
    required this.index,
    required this.controller,
    required this.onValueChanged,
  });

  final int index;
  final PageController controller;
  final void Function(String value) onValueChanged;

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  String? selectedGender;

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onValueChanged(gender);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    
    return BackgroundPic(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            back: () => widget.controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * .02,
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: CircularPercentIndicator(
                  radius: screenWidth * 0.08,
                  lineWidth: screenWidth * 0.02,
                  percent: widget.index / 6,
                  center: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "${widget.index}/6",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                  backgroundColor:  Colors.transparent,
                  progressColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              "Tell us about yourself?",
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
              "We need to know your gender",
              style: TextStyle(
                fontSize: screenWidth * 0.038,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
              child: Container(
                height: screenHeight * .485,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * .03,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () => selectGender("Male"),
                            child: Container(
                              height: screenWidth * 0.28,
                              width: screenWidth * 0.28,
                              decoration: BoxDecoration(  color: selectedGender == "Male"
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedGender == "Male"
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  width: screenWidth * 0.007,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.male, color: Colors.white, size: screenWidth * 0.19),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.038,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),

                          GestureDetector(
                            onTap: () => selectGender("Female"),
                            child: Container(
                              height: screenWidth * 0.28,
                              width: screenWidth * 0.28,
                              decoration: BoxDecoration(
                                color: selectedGender == "Female"
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedGender == "Female"
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  width: screenWidth * 0.007,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Icon(Icons.female, color: Colors.white, size: screenWidth * 0.19),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.038,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                            child: ElevatedButton(
                              onPressed: selectedGender == null
                                  ? null
                                  : () {
                               UserModel.instance.gender=selectedGender;
                                widget.controller.nextPage(
                                  duration:
                                  const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedGender == null
                                    ? Colors.white
                                    : AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                                ),
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.038,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
