import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_logo.dart';
import 'package:service43/screens/components/my_snack_bars.dart';
import 'package:service43/screens/sign_up_screen.dart';
import 'package:service43/screens/components/my_button.dart';


class RegisterData {
  String email = '';
  String password = '';
  String replyPassword = '';
  bool isPolicy = false;

  bool correctPassword() => password == replyPassword;
}


class RegisterScreen extends StatefulWidget {
  static final route = SignUpScreen.route + '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  bool policyAnonymous = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _data = RegisterData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              MyLogo('Register'),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  hintText: emailExample,
                  labelText: 'Email'
                ),
                validator: (String value) {
                  return value.isEmpty
                    ? 'Please enter some text'
                    : null;
                },
                onSaved: (String value) {
                  this._data.email = value;
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(
                  hintText: passwordExample,
                  labelText: 'Password'
                ),
                validator: (String value) {
                  return value.isEmpty && value.length <= 5
                    ? 'Please enter some text'
                    : null;
                },
                onSaved: (String value) {
                  this._data.password = value;
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(
                  hintText: passwordExample,
                  labelText: 'Reply password'
                ),
                validator: (_) {
                  return this._data.correctPassword()
                    ? null
                    : 'Password don\'t correct';
                },
                onSaved: (String value) {
                  this._data.replyPassword = value;
                },
              ),
              SizedBox(height: 15),

              Row(children: [
                Checkbox(
                  value: this._data.isPolicy,
                  onChanged: (bool value) {
                    this._data.isPolicy = value;
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
                        email: this._data.email,
                        password: this._data.password
                      );
                    auth.currentUser.sendEmailVerification();
                    } on FirebaseAuthException catch (err) {
                      var message = 'error';
                      switch (err.code) {
                        case 'email-already-in-use':
                          message = 'Этот электронный адрес уже занят';
                          break;
                        case 'invalid-email':
                          message = 'Неверный адрес электронной почты';
                          break;
                        case 'operation-not-allowed':
                          message = 'Операция не разрешена';
                          break;
                        case 'weak-password':
                          message = 'Пароль недостаточно надежный';
                          break;
                      }
                      mySnackBarText(context, message);
                      printDebug([message]);
                    }
                    Navigator.pop(context);
                  }
                },
                btnTheme: MyButtonTheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
