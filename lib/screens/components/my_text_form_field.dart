import 'package:flutter/material.dart';

import 'package:service43/config.dart';

class MyTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final String hintText;
  final Color hintColor;
  final String labelText;
  final Color labelColor;
  final Color textColor;
  final Function validator;
  final Function onSaved;

  MyTextFormField({
    Key key,
    this.inputType,
    this.onSaved,
    this.hintText,
    this.labelText,
    this.validator,
    this.hintColor = secondaryColor,
    this.labelColor = secondaryColor,
    this.textColor = secondaryColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.inputType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor
          )
        ),
        hintText: this.hintText,
        hintStyle: TextStyle(
          color: this.hintColor
        ),
        labelText: this.labelText,
        labelStyle: TextStyle(
          color: this.labelColor
        )
      ),
      style: TextStyle(
        color: this.textColor
      ),
      validator: this.validator,
      onSaved: this.onSaved,
    );
  }
}