import 'package:flutter/material.dart';


class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const MyText(
    this.text,
    {
      Key key,
      this.color = Colors.white,
      this.textAlign,
      this.fontSize = 16,
      this.fontWeight
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: this.color,
        fontSize: this.fontSize,
        fontWeight: this.fontWeight
      ),
      textAlign: this.textAlign,
    );
  }
}