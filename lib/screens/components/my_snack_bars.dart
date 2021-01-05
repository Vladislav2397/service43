import 'package:flutter/material.dart';

mySnackBarText(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content))
  );
}

mySnackBarWithButton(
  BuildContext context,
  { String content,
    String buttonText,
    Function buttonPressFunc }
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      action: SnackBarAction(
        onPressed: buttonPressFunc,
        label: buttonText,
      )
    )
  );
}