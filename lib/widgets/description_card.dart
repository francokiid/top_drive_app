import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/widgets/outlined_card.dart';

class DescriptionCard extends StatelessWidget {
  final String title;
  final String description;

  const DescriptionCard(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedCard(
          color: primaryColor,
          child: Column(
            children: [
              Text(title, 
                style: smallBlackBold),
              mediumVSpace,
              Text(description, 
                style: smallBlack, 
                textAlign: TextAlign.justify),
            ],
          ),
        ),
      ],
    );
  }
}
