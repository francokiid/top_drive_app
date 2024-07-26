import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/widgets/custom_alertdialog.dart';
import 'package:top_drive_app/widgets/edit_dialog.dart';

class InstructorSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text('Account Settings', style: mediumBlackBold),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGeneralSection(context),
            _buildPreferencesSection(context),
            const Spacer(),
            _buildSignOutButton(context),
            largeVSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('GENERAL', style: mediumBlackBold),
        mediumVSpace,
        _buildEditableItem(context, 'Full Name', 'One Dela Cruz'),
        const Divider(),
        _buildEditableItem(context, 'Email', 'onedelacruz@gmail.com'),
        const Divider(),
        _buildEditableItem(context, 'Contact Number', '09390492510'),
        const Divider(),
        _buildEditableItem(context, 'Password', '******', isPassword: true),
        const Divider(),
        largeVSpace,
      ],
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PREFERENCES', style: mediumBlackBold),
        mediumVSpace,
        _buildEditableItem(context, 'Notifications', 'On'),
        const Divider(),
      ],
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _showLogoutDialog(context);
        },
        style: orangeButton,
        child: const Text('SIGN OUT'),
      ),
    );
  }

  Widget _buildEditableItem(BuildContext context, String title, String value, {bool isPassword = false, bool isEditable = true}) {
    return EditItems.buildEditableItem(context, title, value, isPassword: isPassword, isEditable: isEditable);
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: 'Log out of this account?',
          content: 'You will need to log in again to access your account.',
          onNotNowPressed: () => Navigator.pop(context),
          onYesPressed: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context, '/login', ModalRoute.withName('/'),
            );
          },
        );
      },
    );
  }
}