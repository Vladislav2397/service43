import 'package:flutter/material.dart';
import 'package:service43/screens/components/my_button.dart';
import 'package:service43/screens/components/my_phone_form_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Для регистрации отправьте свой номер телефона",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
								MyPhoneFormField('+7 123 456 78 89'),
                MyButton(
                  btnText: "Отправить",
                  btnTheme: MyButtonTheme.primary,
                  btnPressFunc: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
