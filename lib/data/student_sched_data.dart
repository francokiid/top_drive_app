import 'package:flutter/material.dart';

class StudentSchedData {
  final AssetImage instructorImg;
  final String instructorName;
  final String date;
  final String time;
  final String course;
  final String status;

  const StudentSchedData({
    required this.instructorImg,
    required this.instructorName,
    required this.date,
    required this.time,
    required this.course,
    required this.status
  });
}

const List<StudentSchedData> upcomingSched = [
  StudentSchedData(
    instructorImg: AssetImage('assets/images/instructor1.jpg'),
    instructorName: 'Maraiah Cruz',
    date: 'Monday, 09/01/2024',
    time: '09:00 AM',
    course: 'Theoretical Driving Course',
    status: 'upcoming',
  ),
  StudentSchedData(
    instructorImg: AssetImage('assets/images/instructor2.png'),
    instructorName: 'John Dexter Chua',
    date: 'Tuesday, 09/02/2024',
    time: '09:00 AM',
    course: 'Theoretical Driving Course',
    status: 'upcoming',
  ),
];

const List<StudentSchedData> completedSched = [];

const List<StudentSchedData> cancelledSched = [
  StudentSchedData(
    instructorImg: AssetImage('assets/images/instructor2.png'),
    instructorName: 'John Dexter Chua',
    date: 'Monday, 08/01/2024',
    time: '09:00 AM',
    course: 'Practical Driving Course - 4 Wheels',
    status: 'cancelled',
  ),
];
