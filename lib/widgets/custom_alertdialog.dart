import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/styles.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onNotNowPressed;
  final VoidCallback onYesPressed;

  CustomAlertDialog({
    required this.title,
    required this.content,
    required this.onNotNowPressed,
    required this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: mediumBlackBold),
      content: Text(content, style: smallBlack,),
      actions: <Widget>[
        TextButton(
          onPressed: onNotNowPressed,
          child: Text('Not Now', style: smallBlack,),
        ),
        TextButton(
          onPressed: onYesPressed,
          child: Text('Yes', style: smallBlackBold,),
        ),
      ],
);
  }
}
