import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/colors.dart';

class SolidTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  const SolidTabBar({super.key, required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: blackColorLight,
      borderRadius: BorderRadius.circular(10.0)
      ),
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: blackColor),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: whiteColor,
        unselectedLabelColor: whiteColor,
        dividerColor: Colors.transparent,
        tabs: tabs,
      ),
    );
  }
}