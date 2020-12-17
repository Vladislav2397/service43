import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> items;
  final String hintText;
  const MyDropdownButton({Key key, this.items, this.hintText}) : super(key: key);

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String currentValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(widget.hintText),
      value: currentValue,
      onChanged: (String val) {
        setState(() {
          currentValue = val;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
