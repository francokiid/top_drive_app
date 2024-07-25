import 'package:flutter/material.dart';

class InstructorSchedData {
  final IconData icon;
  final List<String> students;
  final DateTime date;
  final String time;
  final String course;
  final String status;

  const InstructorSchedData({
    required this.icon,
    required this.students,
    required this.date,
    required this.time,
    required this.course,
    required this.status
  });
}

List<InstructorSchedData> instructorSched = [
  InstructorSchedData(
    icon: Icons.directions_car_rounded,
    students: ['Joann Balmes'],
    date: DateTime.now(),
    time: '07:00 AM - 09:00 AM',
    course: 'Practical Driving Course - 4 wheels',
    status: 'upcoming',
  ),
  InstructorSchedData(
    icon: Icons.directions_car_rounded,
    students: ['Cathy Sanchez'],
    date: DateTime.now(),
    time: '09:00 AM - 11:00 AM',
    course: 'Practical Driving Course - 2 wheels',
    status: 'upcoming',
  ),
  InstructorSchedData(
    icon: Icons.library_books_rounded,
    students: ['Joann Balmes'],
    date: DateTime.now().add(const Duration(days: 1)),
    time: '01:00 PM - 03:00 PM',
    course: 'Practical Driving Course - 4 wheels',
    status: 'upcoming',
  ),
  InstructorSchedData(
    icon: Icons.library_books_rounded,
    students: ['Nhica Malapitan'],
    date: DateTime.now().add(const Duration(days: 2)),
    time: '01:00 PM - 03:00 PM',
    course: 'Practical Driving Course - 2 wheels',
    status: 'upcoming',
  ),
  InstructorSchedData(
    icon: Icons.library_books_rounded,
    students: ['Angel Franco'],
    date: DateTime.now().add(const Duration(days: 4)),
    time: '09:00 AM - 11:00 AM',
    course: 'Practical Driving Course - 3 wheels',
    status: 'upcoming',
  ),
];
