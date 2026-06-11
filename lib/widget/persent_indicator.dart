import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  final String title;
  final int current;
  final int total;
  final Color progressColor;
  final Color backgroundColor;
  final Color titleColor;

  const PercentIndicator({
    super.key,
    required this.title,
    required this.current,
    required this.total,
    required this.progressColor,
    required this.backgroundColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    double percent = current / total;
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),
        ),

        SizedBox(height: 12),

        CircularPercentIndicator(
          radius: 60,
          lineWidth: 12,
          percent: percent,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: progressColor,
          backgroundColor: backgroundColor,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$current/$total",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("(${(percent * 100)}%)", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
