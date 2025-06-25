import 'dart:ui';

import 'package:flutter/material.dart';

class WheelWidget extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final Function(int) onValueChanged;
  final String unit;

  const WheelWidget({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onValueChanged,
    required this.unit,
  }) : super(key: key);

  @override
  State<WheelWidget> createState() => _WheelWidgetState();
}

class _WheelWidgetState extends State<WheelWidget> {
  late FixedExtentScrollController _scrollController;
  late int _selectedValue;

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
        filter: ImageFilter.blur(sigmaX: 35, sigmaY:35),
        child: Container(
          height: MediaQuery.of(context).size.height * .3,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView.useDelegate(
              controller: _scrollController,
              itemExtent: 80,
              perspective: 0.003,
              diameterRatio: 2.0,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedValue = widget.minValue + index;
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
                          color: isSelected ? Colors.orange : Colors.white70,
                          fontSize: isSelected ? 44 : 24,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}
