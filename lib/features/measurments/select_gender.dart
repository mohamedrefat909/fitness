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
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .04,
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: CircularPercentIndicator(
                  radius: 35,
                  lineWidth: 8.0,
                  percent: widget.index / 6,
                  center: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "${widget.index}/6",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  backgroundColor:  Colors.transparent,
                  progressColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Tell us about yourself?",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "We need to know your gender",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 25),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .03,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Male Option
                          GestureDetector(
                            onTap: () => selectGender("Male"),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(  color: selectedGender == "Male"
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedGender == "Male"
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.male, color: Colors.white, size: 80),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),

                          GestureDetector(
                            onTap: () => selectGender("Female"),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: selectedGender == "Female"
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedGender == "Female"
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: const [
                                  Icon(Icons.female, color: Colors.white, size: 80),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
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
