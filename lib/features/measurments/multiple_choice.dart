import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../core/app_colors/colors.dart';
import '../../core/widgets/background_pic.dart';
import '../../core/widgets/custom_app_bar.dart';

class MultipleChoicePage extends StatefulWidget {
  final PageController controller;
  final int index;
  final String question;
  final List<String> options;
  final Function(String value) onSave;
  final bool isLast;

  const MultipleChoicePage({
    super.key,
    required this.controller,
    required this.index,
    required this.question,
    required this.options,
    required this.onSave,
    this.isLast = false,
  });

  @override
  State<MultipleChoicePage> createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return BackgroundPic(
      backgroundImage: 'assets/images/background.png',
      child: ListView(
        children: [
          CustomAppBar(
            back: () => widget.controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
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
                  backgroundColor: Colors.transparent,
                  progressColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              widget.question,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              "This helps us create your personalized plan",
              style: TextStyle(
                fontSize: screenWidth * 0.038,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          ...widget.options.map((option) {
            final isSelected = selectedValue == option;
            return GestureDetector(
              onTap: () => setState(() => selectedValue = option),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: Colors.white),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        option,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          SizedBox(height: screenHeight * 0.04),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (selectedValue != null) {
                  widget.onSave(selectedValue!);
                  if (widget.isLast) {
                    print("All data collected: ");
                  } else {
                    widget.controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select an option")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedValue == null
                    ? AppColors.lightGrey
                    : AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(screenWidth * 0.9, 38),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
