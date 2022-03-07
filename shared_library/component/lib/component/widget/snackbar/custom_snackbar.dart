import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSnackBar({
    required String message,
    required BuildContext context,
    isError =  false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 500),
      content: Text(message),
      backgroundColor: isError ?Colors.red :Colors.green,
    ));
  }


}
