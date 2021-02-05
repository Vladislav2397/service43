import 'package:flutter/material.dart';

import 'package:service43/config.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hintText;
  final Color hintColor;
  final String labelText;
  final Color labelColor;
  final Color textColor;
  final Function validator;
  final Function onSaved;
  final String initialValue;

  MyTextFormField({
    Key key,
    this.inputType,
    this.onSaved,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.validator,
    this.controller,
    this.hintColor = secondaryColor,
    this.labelColor = secondaryColor,
    this.textColor = secondaryColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.inputType,
      controller: this.controller,
      validator: this.validator,
      onSaved: this.onSaved,
      initialValue: this.initialValue,
      style: TextStyle(
        color: this.textColor
      ),
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor
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
    );
  }
}