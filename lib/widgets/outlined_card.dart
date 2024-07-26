import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';

class OutlinedCard extends StatelessWidget {
  final Color color;
  final Widget child;

  const OutlinedCard({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: color,
          width: 2,
        ),
      ),
      child: Padding(
        padding: smallPadding,
        child: child,
      ),
    );
  }
}