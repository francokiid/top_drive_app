import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/data/student_sched_data.dart';
import 'package:top_drive_app/widgets/schedule_card.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    const Tab(text: 'upcoming'),
    const Tab(text: 'completed'),
    const Tab(text: 'cancelled'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SCHEDULE', style: blackPageTitle),
              const Icon(Icons.filter_list_rounded)
            ],
          ),
          mediumVSpace,
            
          TabBar(
            controller: _tabController,
            tabs: _tabs,
            labelColor: blackColor,
            labelStyle: smallBlackBold,
            unselectedLabelColor: blackColor,
            indicatorColor: primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
          ),
          largeVSpace,
            
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ScheduleCard(schedule: upcomingSched, schedType: 'upcoming'),
                ScheduleCard(schedule: completedSched, schedType: 'completed'),
                ScheduleCard(schedule: cancelledSched, schedType: 'cancelled')
              ],
            )
          ),
        ]
      ),
    );
  }
}