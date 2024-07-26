import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/screens/instructor/home.dart';
import 'package:top_drive_app/screens/instructor/schedule.dart';
import 'package:top_drive_app/screens/instructor/students.dart';
import 'package:top_drive_app/screens/instructor/profile.dart';

class InstructorMainLayout extends StatefulWidget {
  const InstructorMainLayout({super.key});

  @override
  State<InstructorMainLayout> createState() => _InstructorMainLayoutState();
}

class _InstructorMainLayoutState extends State<InstructorMainLayout> {
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
              Home(),
              InstructorSchedule(),
              Students(),
              Profile(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: blackColor,
        unselectedItemColor: blackColorLight,
        iconSize: 24,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
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
            icon: Icon(Icons.home_rounded),
            label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Schedule'),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_2_rounded),
            label: 'Students'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile'),
        ],
      ),
    );
  }
}
