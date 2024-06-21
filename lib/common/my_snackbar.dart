import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


showSnackBar(
  {required BuildContext context, 
  required String text, bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: (isErro)? Colors.red: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16)
      )
    ),
    duration: const Duration(seconds: 4),
    showCloseIcon: true,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}