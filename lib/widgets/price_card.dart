import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';

class PriceCard extends StatelessWidget {
  final Map<String, String> price;

  const PriceCard({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: price.entries.map((entry) {
        return Card(
          color: primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(entry.value, style: mediumBlackBold),
              Text(entry.key, style: smallBlack),
              largeVSpace,
              ElevatedButton(
                style: blackButton,
                onPressed: (){
                  _confirmEnrollment(context, entry.key);
                },
                child: const Text('ENROLL')
              )
            ]
          ),
        );
      }).toList(),
    );
  }

  void _confirmEnrollment(BuildContext context, String courseName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController passwordController = TextEditingController();
        return AlertDialog(
          title: Text('Confirm Enrollment', style: mediumBlackBold,),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter your password to confirm:', style: smallBlack),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: blackColorLight, fontSize: 12),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: smallBlack),
            ),
            TextButton(
              onPressed: () {
                String enteredPassword = passwordController.text.trim();
                if (enteredPassword.isNotEmpty) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Enrollment confirmed!'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid password. Please try again.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Text('Confirm', style: smallBlackBold,),
            ),
          ],
        );
      },
    );
  }
}