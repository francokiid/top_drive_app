import 'package:flutter/material.dart';

class CourseData {
  final IconData icon;
  final String title;
  final String desc;
  final Map<String, String> price;

  const CourseData({required this.icon, required this.title, required this.desc,  required this.price});
}

const List<CourseData> courseList = [
  CourseData(
    icon: Icons.menu_book_rounded,
    title: 'Theoretical Driving Course',
    desc: 'The Theoretical Driving Course (TDC) is a mandatory requirement for all aspiring drivers applying for a Student\u0027s Driver\u0027s Permit. This comprehensive course provides essential knowledge and understanding of traffic laws, road safety principles, and responsible driving practices.',
    price: {
      '15 hours' : 'Php 1,000'}),
  CourseData(
    icon: Icons.directions_car_rounded,
    title: 'Practical Driving Course - 4 Wheels',
    desc: 'Our Practical Driving Course for Four-Wheeled Vehicles is designed to equip you with the necessary skills and confidence to drive safely and responsibly. Whether you\u0027re a beginner or looking to refine your driving abilities, this course provides hands-on training in real-world driving scenarios.',
    price: {
      '8 hrs' : 'Php 4,000',
      '10 hrs' : 'Php 5,000',
      '14 hrs' : 'Php 8,600',
      '20 hrs' : 'Php 10,600',}),
  CourseData(
    icon: Icons.two_wheeler_rounded,
    title: 'Practical Driving Course - 2 Wheels',
    desc: 'Our Practical Driving Course for Two-Wheeled Vehicles focuses on essential skills for operating motorcycles safely. Whether you\u0027re new to riding or need to refine your skills, this course covers both basic and advanced techniques to ensure safe and confident riding.',
    price: {
      '8 hrs' : 'Php 4,000',
      '10 hrs' : 'Php 5,000',
      '14 hrs' : 'Php 8,600',
      '20 hrs' : 'Php 10,600',}),
];

const List<CourseData> coursesEnrolled = [
  CourseData(
    icon: Icons.menu_book_rounded,
    title: 'Theoretical Driving Course',
    desc: 'Mandated by LTO. Student drivers permit will be issued to aspiring new drivers upon completion of a 15 hour lecture.',
    price: {
      'Automatic Shift' : 'Php 4000',
      'Manual Shift' : 'Php 4000'})
];

