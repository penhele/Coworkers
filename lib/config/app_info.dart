import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';

class AppInfo {
  static toastSuccess(String message) {
    DInfo.toastSuccess(message);
  }

  static success(BuildContext context, String message) {
    // DInfo.snackBarSuccess(context, message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      )
    );
  }

  static failed(BuildContext context, String message) {
    // DInfo.snackBarError(context, message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFE65556),
        duration: const Duration(seconds: 2),
      )
    );
  }
}