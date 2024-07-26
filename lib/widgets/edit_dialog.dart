import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';

class EditItems {
  static Widget buildEditableItem(BuildContext context, String title, String value, {bool isPassword = false, bool isEditable = true}) {
    return ListTile(
      contentPadding: horizontalPadding,
      title: Text(title, style: smallBlackBold),
      trailing: isEditable
        ? isPassword
            ? Text('******', style: smallBlack)
            : Text(value, style: smallBlack)
        : Text(value, style: smallBlack),
      onTap: () {
        if (isEditable && title != 'Notifications') {
          _showEditDialog(context, title, value, isPassword: isPassword);
        }
      },
    );
  }

  static void _showEditDialog(BuildContext context, String title, String currentValue, {bool isPassword = false}) {
    TextEditingController controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $title', style: mediumBlackBold),
          content: TextField(
            controller: controller,
            obscureText: isPassword,
            style: smallBlack,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('CANCEL', style: smallBlack),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saved changes!'),
                    duration: Duration(seconds: 3),
                  ),
                );
                Navigator.pop(context);
              },
              style: blackButton,
              child: const Text('SAVE'),
            ),
          ],
        );
      },
    );
  }
}
