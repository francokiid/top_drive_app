import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/sizes.dart';

class GradientCard extends StatelessWidget {
  final List<Color> gradientColors;
  final Widget child;

  const GradientCard({super.key, required this.gradientColors, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: RadialGradient(
            colors: gradientColors,
            center: Alignment.center,
            radius: 0.8
          ),
        ),
        child: Padding(
          padding: smallPadding,
          child: child,
        ),
      ),
    );
  }
}