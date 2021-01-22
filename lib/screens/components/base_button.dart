import 'package:flutter/material.dart';

import 'package:service43/config.dart';

// todo: long button extends base button

class BaseButton extends StatelessWidget {
  final bool isLong;
  final String text;
  final double borderRadius;
  final double textSize;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final EdgeInsets padding;
  final IconData icon;
  final Function onPressed;

  const BaseButton({
    Key key,
    this.isLong = true,
    this.borderRadius = 23.0,
    this.textSize = 20,
    this.text = '',
    this.color = secondaryColor,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(
      vertical: 12.0, horizontal: 16.0
    ),
    this.borderColor,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
       child: this.childButton,
      color: this.color,
      textColor: this.textColor,
      padding: this.padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.borderRadius),
        side: BorderSide(color: this.borderColor ?? this.color)
      ),
      onPressed: this.onPressed ?? () {}
    );
  }

  Widget get textWidget => Text(
    text,
    style: TextStyle(
      fontSize: this.textSize,
    ),
    textAlign: TextAlign.center,
  );

  Widget get childButton {
    if (isLong) {
      return SizedBox(
        width: double.infinity,
        child: textWidget
      );
    } else if (!isLong && icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 25, child: Icon(icon)),
          SizedBox(width: 75, child: textWidget)
        ],
      );
    } else {
      return textWidget;
    }
  }
}