import 'dart:ui';

import 'package:fitness/core/app_colors/colors.dart';
import 'package:fitness/core/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class WheelWidget extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final Function(int) onValueChanged;
  final void Function() onTap;
  final String unit;
  final String buttonText;

  const WheelWidget({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onValueChanged,
    required this.unit,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  State<WheelWidget> createState() => _WheelWidgetState();
}

class _WheelWidgetState extends State<WheelWidget> {
  late FixedExtentScrollController _scrollController;
  late int _selectedValue;
  bool _isChanged = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    _scrollController = FixedExtentScrollController(
      initialItem: widget.initialValue - widget.minValue,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
        child: Container(
          height: screenHeight * .32,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * .02,
                ),
                child: Text(
                  widget.unit,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: ListWheelScrollView.useDelegate(
                    controller: _scrollController,
                    itemExtent: screenHeight * 0.09,
                    perspective: 0.003,
                    diameterRatio: 2.0,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      final newValue = widget.minValue + index;
                      if (newValue != widget.initialValue && !_isChanged) {
                        setState(() {
                          _isChanged = true;
                        });
                      }
                      setState(() {
                        _selectedValue = newValue;
                      });
                      widget.onValueChanged(_selectedValue);
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: widget.maxValue - widget.minValue + 1,
                      builder: (context, index) {
                        final value = widget.minValue + index;
                        final isSelected = value == _selectedValue;

                        return RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                color: isSelected
                                    ? AppTheme.lightTheme.primaryColor
                                    : Colors.white70,
                                fontSize: isSelected ? screenWidth * 0.11 : screenWidth * 0.06,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_up,
                color: AppColors.primaryColor,
                size: screenWidth * 0.08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035, vertical: screenHeight * 0.015),
                child: ElevatedButton(
                  onPressed: _isChanged ? widget.onTap : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isChanged
                        ? AppColors.primaryColor
                        : AppColors.primaryColor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                  ),
                  child: Text(
                    widget.buttonText,
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
      ),
    );
  }
}

