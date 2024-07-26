import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/widgets/description_card.dart';
import 'package:top_drive_app/data/reviews_data.dart';
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
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () => Navigator.pushNamed(context, '/instructor_settings'),
              ),
          ),

          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/instructor1.jpg'),
          ),
          mediumVSpace,
          Text('One Dela Cruz', style: largeBlack),
          Text('onedelacruz@gmail.com', style: smallBlack),
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
    );
  }

  
}


