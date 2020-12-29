import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';

class SignUpScreen extends StatelessWidget {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              appName,
              style: TextStyle(
                  color: Colors.green[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _emailCtrl,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _passwordCtrl,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 30),
            MyButton(
              btnText: "Войти",
              btnPressFunc: () => signUp(
                  _emailCtrl.text.trim(), _passwordCtrl.text.trim(), context),
              btnTheme: MyButtonTheme.primary,
            ),
            SizedBox(height: 15),
            MyButton(
              btnText: "Зарегестрироваться",
              btnPressFunc: () {
                Navigator.of(context).pushReplacementNamed('/register');
              },
              btnTheme: MyButtonTheme.secondary,
            )
          ],
        ),
      ),
    );
  }

  void signUp(email, password, context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (auth.currentUser != null) {
        Navigator.of(context).popAndPushNamed('/index');
      }
    } catch (e) {
      print("Error");
    }
  }
}