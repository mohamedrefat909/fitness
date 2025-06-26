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
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
        child: Container(
          height: MediaQuery.of(context).size.height * .32,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03,
                ),
                child: Text(
                  widget.unit,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: ListWheelScrollView.useDelegate(
                    controller: _scrollController,
                    itemExtent: 80,
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
                                fontSize: isSelected ? 44 : 24,
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
                size: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ElevatedButton(
                  onPressed: _isChanged ? widget.onTap : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isChanged
                        ? AppColors.primaryColor
                        : AppColors.primaryColor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    widget.buttonText,
                    style: const TextStyle(color: Colors.white),
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

