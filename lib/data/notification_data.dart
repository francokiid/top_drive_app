import 'package:flutter/material.dart';

class NotificationData {
  final IconData icon;
  final String text;
  final DateTime timestamp;
  final bool read;
  final String route;

  const NotificationData({
    required this.icon,
    required this.text,
    required this.timestamp,
    required this.read,
    required this.route});
}

List<NotificationData> notifications = [
  NotificationData(
    icon: Icons.verified_user_outlined,
    text: 'Welcome to Top Drive! Your account has been successfully created.',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    read: true,
    route: '/'
  ),
  NotificationData(
    icon: Icons.directions_car_rounded,
    text: 'You have successfully enrolled in the Practical Driving Course - 4 Wheels.',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    read: true,
    route: '/profile'
  ),
  NotificationData(
    icon: Icons.event_available_rounded,
    text: 'Your upcoming driving lesson with instructor John Dexter has been scheduled.',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    read: true,
    route: '/schedule'
  ),
  NotificationData(
    icon: Icons.event_busy_rounded,
    text: 'Your schedule has been cancelled.',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    read: true,
    route: '/schedule'
  ),
  NotificationData(
    icon: Icons.library_books_outlined,
    text: 'You have successfully enrolled in the Theoretical Driving Course.',
    timestamp: DateTime.now().subtract(const Duration(hours: 6)),
    read: false,
    route: '/profile'
  ),
];