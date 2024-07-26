import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/widgets/description_card.dart';
import 'package:top_drive_app/data/reviews_data.dart';
import 'package:top_drive_app/data/instructor_data.dart';
import 'package:top_drive_app/widgets/solid_tabbar.dart';

class Instructor extends StatefulWidget {
  final InstructorData instructor;

  const Instructor(this.instructor, {super.key});

  @override
  State<Instructor> createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> with SingleTickerProviderStateMixin {
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
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text('Instructor Details',
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
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(widget.instructor.image),
            ),
            mediumVSpace,
            Text(widget.instructor.name, style: largeBlack),
            Text(widget.instructor.email, style: smallBlack),
            largeVSpace,
              
            SolidTabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  icon: Icon(Icons.bar_chart_rounded, color: primaryColor),
                  text: 'Details',
                ),
                Tab(
                  icon: Icon(Icons.star_rounded, color: primaryColor),
                  text: 'Reviews',
                ),
              ],
            ),
            largeVSpace,
              
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:  [
                  const DescriptionCard('Short Bio', 'I am a dedicated driving instructor renowned for patient guidance and comprehensive approach to road safety. With over 15 years of teaching experience, I specialize in helping learners build confidence behind the wheel while instilling essential defensive driving skills.'),
                  
                  ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: smallPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reviews[index].title,
                              style: mediumBlackBold,
                            ),
                            smallVSpace,
                            Text(
                              reviews[index].content,
                              style: smallBlack,
                            ),
                            smallVSpace,
                            Text(
                                  'Rating: ${reviews[index].rating}',
                                  style: smallBlack,
                                ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } 
}