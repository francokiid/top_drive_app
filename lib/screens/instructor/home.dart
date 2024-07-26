import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/data/instructor_sched_data.dart';
import 'package:top_drive_app/widgets/outlined_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('TOP DRIVE', style: blackPageTitle),
              const Icon(Icons.tune_rounded)
            ],
          ),
          largeVSpace,

          Card(
            color: blackColor,
            child: Padding(
              padding: smallPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Scheduled Today', style: largestWhite,),
                  Text('02', style: largestYellow,),
                  const Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 10, left: 20),
                    child: Image(image: AssetImage('assets/images/car.png'), fit: BoxFit.contain,)),
                ],
              ),
            ),
          ),
          smallVSpace,

          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 1.5,
            ),
            children: [
              _buildCard('Courses', '03', Icons.library_books_rounded),
              _buildCard('Students', '25', Icons.group_rounded),
            ],
          ),
          mediumVSpace,
      
          _buildUpcomingSessions(),
          smallVSpace,
        ],
      ),
    );
  }

  Widget _buildCard(String category, String total, IconData icon) {
    return Card(
      color: primaryColor,
      child: Padding(
        padding: smallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: mediumBlackBold,),
                Text(total, style: largestBlack,)
              ],
            ),
            Icon(icon, size: 40, color: blackColor,),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingSessions() {
    return OutlinedCard(
      color: secondaryColor,
      child: Column(
        children: [
          Text('Upcoming Sessions', style: mediumBlackBold,),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(instructorSched[index].course),
                subtitle: const Text('July 26, 2024'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                titleTextStyle: smallBlackBold,
                subtitleTextStyle: smallBlack,
                iconColor: secondaryColor,
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }

  DateTime _getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
