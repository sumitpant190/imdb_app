import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class Utils {
  static snackbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static toastMessage(String message, BuildContext context) {
    FlutterToastr.show(message, context);
  }
}
