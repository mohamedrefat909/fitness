import 'package:fitness/features/measurments/wheel_widget.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/background_pic.dart';

class BodyMeasuresAge extends StatelessWidget {
  const BodyMeasuresAge({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPic(
      child: Column(
        children: [
          WheelWidget(
            onValueChanged: (p0) {},
            initialValue: 10,
            maxValue: 50,
            minValue: 2,
            unit: "year",
          ),

        ],
      ),
    );
  }
}
