import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';
import 'package:service43/screens/sign_up_screen.dart';


class RegisterScreen extends StatefulWidget {
  static final route = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool policyAnonymous = false;
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var replyPasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.green[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(hintText: 'Email'),
              validator: (String value) {
                return value.isEmpty ? 'Please enter some text' : null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordCtrl,
              decoration: InputDecoration(hintText: 'Password'),
              validator: (String value) {
                return value.isEmpty ? 'Please enter some text' : null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: replyPasswordCtrl,
              decoration: InputDecoration(hintText: 'Reply password'),
              validator: (String value) {
                if (value != passwordCtrl.text) {
                  return 'Password don\'t correct';
                } else
                  return null;
              },
            ),
            SizedBox(height: 15),
            Row(children: [
              Checkbox(
                value: policyAnonymous,
                onChanged: (val) {
                  setState(() {
                    policyAnonymous = val;
                  });
                },
              ),
              Text('Я принимаю\nполитикy конфиденциальности')
            ]),
            SizedBox(height: 15),
            MyButton(
              btnText: 'Зарегистрироваться',
              btnPressFunc: () async {
                if (policyAnonymous) {
                  try {
                    auth.createUserWithEmailAndPassword(
                        email: emailCtrl.text, password: passwordCtrl.text);
                    print(auth.currentUser.email);
                  } catch (e) {
                    print(e);
                  }
                  Navigator.popAndPushNamed(context, SignUpScreen.route);
                }
              },
              btnTheme: MyButtonTheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  showPopupEmailVerification() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Подтверждение'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Код был отправлен на ваш почтовый ящик'),
                TextField(
                  decoration: InputDecoration(hintText: 'Введите код'),
                ),
              ],
            ),
            actions: [FlatButton(onPressed: () {}, child: Text('Отправить'))],
          );
        });
  }

  emailVerification() async {
    User user = auth.currentUser;
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
