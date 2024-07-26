import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/data/student_data.dart';
import 'package:top_drive_app/widgets/outlined_card.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    const Tab(text: 'current'),
    const Tab(text: 'past'),
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
              Text('STUDENTS', style: blackPageTitle),
              const Row(
                children: [
                  Icon(Icons.search),
                  mediumHSpace,
                  Icon(Icons.sort_by_alpha),
                ],
              )
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
              children: [
                buildStudentsList(currentStudents),
                buildStudentsList(pastStudents),
              ],
            )
          ),
        ]
      ),
    );
  }

  Widget buildStudentsList(List<Student> students) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (BuildContext context, int index) {
        final student = students[index];
        return OutlinedCard(
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(student.name, style: smallBlackBold),
              Text(student.email, style: smallBlack),
              smallVSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: student.courses
                  .map((course) => Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          const Icon(Icons.star_rounded, color: secondaryColor,),
                          mediumHSpace,
                          Text(course, style: smallBlack),
                        ],
                      ),
                    ))
                .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

}