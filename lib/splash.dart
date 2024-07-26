import 'package:flutter/material.dart';
import 'dart:async';
import 'package:top_drive_app/constants/colors.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Image.asset('assets/images/top_drive_logo.png',
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}