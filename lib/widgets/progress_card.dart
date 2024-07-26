import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/data/course_data.dart';
import 'package:top_drive_app/widgets/outlined_card.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coursesEnrolled.length,
      itemBuilder: ((context, index) {
        return OutlinedCard(
          color: primaryColor,
          child: Column(
            children: [
              Text(coursesEnrolled[index].title, style: mediumBlackBold),
              largeVSpace,
              const SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: 0.33,
                  strokeWidth: 15,
                  color: secondaryColor,
                  backgroundColor: primaryColorLight,
                ),
              ),
              largeVSpace,
              Text('1 out of 3 sessions completed', style: smallBlack,)
            ]
          ),
        );
      }),
    );
  }
}
