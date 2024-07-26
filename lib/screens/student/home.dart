import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/data/course_data.dart';
import 'package:top_drive_app/data/instructor_data.dart';
import 'package:top_drive_app/screens/student/course.dart';
import 'package:top_drive_app/screens/student/instructor.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildImageBanner(),
            mediumVSpace,
            _buildSearchField(),
            mediumVSpace,
            _buildFeaturedCoursesTitle(),
            _buildCourseGrid(),
            mediumVSpace,
            _buildExperiencedInstructorsTitle(),
            _buildInstructorsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TOP DRIVE', style: blackPageTitle),
        smallVSpace,
        Text('We make it easier for you to get your license.', style: smallestBlack),
        largeVSpace,
      ],
    );
  }

  Widget _buildImageBanner() {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(color: primaryColor, width: 10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Image(image: AssetImage('assets/images/car_interior.jpg')),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        contentPadding: smallPadding,
        hintText: 'Search for courses or instructors...',
        hintStyle: smallHint,
        suffixIcon: const Icon(Icons.search, color: blackColorLight),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: blackColorLight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildFeaturedCoursesTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Featured Courses', style: mediumBlackBold),
        smallVSpace,
      ],
    );
  }

  Widget _buildCourseGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1.1,
      ),
      itemCount: courseList.length,
      itemBuilder: (context, index) {
        final course = courseList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Course(course)),
            );
          },
          child: Card(
            color: blackColor,
            child: Padding(
              padding: smallPadding,
              child: Column(
                children: <Widget>[
                  Icon(course.icon, size: 70, color: primaryColor),
                  smallVSpace,
                  Text(
                    course.title,
                    style: smallestWhite,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExperiencedInstructorsTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Experienced Instructors', style: mediumBlackBold),
        smallVSpace,
      ],
    );
  }

  Widget _buildInstructorsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 0.85,
      ),
      itemCount: instructors.length,
      itemBuilder: (context, index) {
        final instructor = instructors[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Instructor(instructor)),
            );
          },
          child: Card(
          color: primaryColor,
          child: Padding(
            padding: smallPadding,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(instructor.image,
                    fit: BoxFit.contain,
                  ),
                ),
                smallVSpace,
                Text(
                  instructor.name,
                  style: smallBlackBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
        );
      },
    );
  }
}
