import 'package:flutter/material.dart';


class MyFormField extends StatelessWidget {
  final String hintText;

  MyFormField(this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: this.hintText),
    );
  }
}