import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackBar(BuildContext context, String message) {
    print('showSnackBar: ');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue.withOpacity(.8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showProgressBar(BuildContext context) {
    print('showProgressBar');
    showDialog(
      context: context,
      builder: (_) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
