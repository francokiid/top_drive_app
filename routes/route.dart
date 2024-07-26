import 'package:flutter/material.dart';
import 'package:top_drive_app/splash.dart';
import 'package:top_drive_app/screens/auth/login.dart';
import 'package:top_drive_app/screens/auth/register.dart';
import 'package:top_drive_app/screens/student/main_layout.dart';
import 'package:top_drive_app/screens/student/settings.dart';
import 'package:top_drive_app/screens/instructor/main_layout.dart';
import 'package:top_drive_app/screens/instructor/settings.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());

      case '/instructor':
        return MaterialPageRoute(builder: (_) => const InstructorMainLayout());
      case '/instructor_settings':
        return MaterialPageRoute(builder: (_) => InstructorSettings());
      
      case '/student':
        return MaterialPageRoute(builder: (_) => const StudentMainLayout());
      case '/student_settings':
        return MaterialPageRoute(builder: (_) => StudentSettings());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR: Page not found'),
        ),
      );
    });
  }
}
