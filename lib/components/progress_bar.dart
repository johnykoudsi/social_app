import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  final double percent;

  ProgressBar({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.zero, // Ensure there's no padding
      margin: EdgeInsets.zero,  // Ensure there's no margin
      child: LinearPercentIndicator(
        width: screenWidth,
        backgroundColor: Colors.grey.shade300,
        progressColor: Colors.white,
        percent: percent,
        lineHeight: 5.0, // You can adjust the height if needed
        padding: EdgeInsets.zero, // Ensure the indicator itself has no padding
      ),
    );
  }
}
