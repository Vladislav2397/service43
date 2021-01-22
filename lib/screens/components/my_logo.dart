import 'package:flutter/material.dart';
import 'package:service43/config.dart';


class MyLogo extends StatelessWidget {
  final String text;

  MyLogo(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: accidentalColor
      ),
    );
  }
}