import 'package:flutter/material.dart';


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
        color: Colors.green[800]
      ),
    );
  }
}