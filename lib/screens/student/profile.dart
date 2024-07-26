import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/widgets/progress_card.dart';
import 'package:top_drive_app/widgets/notification_card.dart';
import 'package:top_drive_app/widgets/solid_tabbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              mediumHSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Karina', style: largeBlack),
                  Text('katarinabluu@gmail.com', style: smallBlack),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/student_settings'),
                child: const Icon(Icons.settings_rounded, color: secondaryColor)
              ),
            ],
          ),
          largeVSpace,
            
          SolidTabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.bar_chart_rounded, color: primaryColor),
                text: 'My Progress',
              ),
              Tab(
                icon: Icon(Icons.notifications, color: primaryColor),
                text: 'Notifications',
              )
            ],
          ),
          largeVSpace,
            
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProgressCard(),
                NotificationList()
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
