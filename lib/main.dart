import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/colors.dart';
import 'package:top_drive_app/routes/route.dart';

void main() {
  runApp(const TopDriveApp());
}

class TopDriveApp extends StatelessWidget {
  const TopDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Drive App',
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: whiteColor,
        canvasColor: whiteColor,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
