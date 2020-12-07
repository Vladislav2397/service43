import 'package:flutter/material.dart';


const primaryColor = Colors.green;
const secondaryColor = Colors.purple;

enum MyButtonTheme { primary, secondary }

class MyButton extends StatelessWidget {
	final String btnText;
	final Function btnPressFunc;
	final MyButtonTheme btnTheme;

	MyButton({this.btnText, this.btnPressFunc, this.btnTheme});

	@override
	Widget build(BuildContext context) {
		return RaisedButton(
			onPressed: this.btnPressFunc,
			padding: EdgeInsets.all(0),
			color: this._getButtonTheme(this.btnTheme),
			textColor: Colors.white,
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(6)
			),
			child: Container(
				child: Text(
					this.btnText,
					style: TextStyle(fontSize: 20),
				),
				padding: EdgeInsets.symmetric(
					vertical: 13, horizontal: 30
				),
			),
		);
	}

	Color _getButtonTheme(MyButtonTheme theme) {
		if (theme == MyButtonTheme.primary) return primaryColor;
		else if (theme == MyButtonTheme.secondary) return secondaryColor;
		else throw Exception("Wrong type theme"); 
	}
}