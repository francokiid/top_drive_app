import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/widgets/solid_tabbar.dart';
import 'package:top_drive_app/widgets/description_card.dart';
import 'package:top_drive_app/widgets/price_card.dart';
import 'package:top_drive_app/data/course_data.dart';

class Course extends StatefulWidget {
  final CourseData course;

  const Course(this.course, {super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(widget.course.title,
            style: mediumBlackBold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_rounded, size: 16, color: blackColor,),
           ),
        ),
      ),

      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              child: Card(
                color: blackColor,
                child: Padding(
                  padding: smallPadding,
                  child: Icon(widget.course.icon, size: 100, color: whiteColor),
                ),
              ),
            ),
            mediumVSpace,

            SolidTabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  icon: Icon(Icons.notes_rounded, color: primaryColor,),
                  text: 'Overview',
                ),
                Tab(
                  icon: Icon(Icons.price_change_rounded, color: primaryColor,),
                  text: 'Pricing Plan',
                )
              ],
            ),
            mediumVSpace,

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DescriptionCard('Description', widget.course.desc),
                  PriceCard(price: widget.course.price),
                ],
              ),
            )  
          ],
        ),
      ),
    );
  }
}