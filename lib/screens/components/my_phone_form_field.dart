import 'package:flutter/material.dart';

class MyPhoneFormField extends StatelessWidget {
  final String hintText;

  MyPhoneFormField(this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: this.hintText),
      textAlign: TextAlign.center,
    );
  }
}