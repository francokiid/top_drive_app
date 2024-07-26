import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/screens/student/home.dart';
import 'package:top_drive_app/screens/student/schedule.dart';
import 'package:top_drive_app/screens/student/profile.dart';

class StudentMainLayout extends StatefulWidget {
  const StudentMainLayout({super.key});

  @override
  State<StudentMainLayout> createState() => _StudentMainLayoutState();
}

class _StudentMainLayoutState extends State<StudentMainLayout> {
  int _currentIndex = 0;
  final PageController _index = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: PageView(
            controller: _index,
            onPageChanged: ((value) {
              setState(() {
                _currentIndex = value;
              });
            }),
            children: const <Widget> [
              StudentHome(),
              Schedule(),
              Profile(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: blackColor,
        iconSize: 24,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        unselectedLabelStyle: const TextStyle(fontSize: 12, fontFamily: 'Inter'),
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _index.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        }, 
        
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Schedule'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile'),
        ],
      ),
    );
  }
}
