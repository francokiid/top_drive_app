import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/data/notification_data.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key});

  @override
  Widget build(BuildContext context) {
    notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Container(
            color: notifications[index].read ? shadowColor : primaryColor.withOpacity(0.3),
            child: ListTile(
              leading: Icon(notifications[index].icon),
              title: Text(notifications[index].text, textAlign: TextAlign.justify,),
              titleTextStyle: notifications[index].read ? smallBlack : smallBlackBold,
              titleAlignment: ListTileTitleAlignment.titleHeight,
              subtitle: Text(timeAgo(notifications[index].timestamp), textAlign: TextAlign.end,),
              subtitleTextStyle: smallestBlack,
              iconColor: blackColor,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }

  String timeAgo(DateTime timestamp) {
    Duration difference = DateTime.now().difference(timestamp);
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} mins ago';
    } else {
      return 'just now';
    }
  }
}
