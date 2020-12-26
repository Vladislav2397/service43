import 'package:flutter/material.dart';
import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';

// import 'log_in_screen.dart';
// import 'register_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

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
              btnText: "Отправить",
              btnPressFunc: () async {
                var email = _emailCtrl.text;
                var password = _passwordCtrl.text;
                try {
                  await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (auth.currentUser != null) {
                    Navigator.pushNamed(context, '/');
                  }
                } catch (e) {
                  print("error");
                }
              },
              btnTheme: MyButtonTheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
