import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';
import 'package:service43/screens/components/my_logo.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/register_screen.dart';


class LoginData {
  var _phone = '';

  get phone => this._phone;
  set phone(String value) => this._phone = value.toString().trim();
}


class SignUpScreen extends StatefulWidget {
  static final route = '/sign-up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  LoginData _data = LoginData();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyLogo(appName),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '+79009999999',
                  labelText: 'Phone'
                ),
                validator: (String value) {
                return value.isEmpty
                  ? 'Please input correct phone'
                  : null;
              },
                onSaved: (String value) {
                _data.phone = value;
              },
              ),
              SizedBox(height: 30),
              MyButton(
                btnText: 'Войти',
                btnPressFunc: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    signUp(context, _data.phone);
                  }
              },
                btnTheme: MyButtonTheme.primary,
              ),
              SizedBox(height: 15),
              MyButton(
                btnText: 'Зарегистрироваться',
                btnPressFunc: () {
                  Navigator.of(context).pushNamed(RegisterScreen.route);
                },
                btnTheme: MyButtonTheme.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUp(BuildContext context, String phone) async {

    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Navigator.of(context)
          .pushNamedAndRemoveUntil(
            HomeScreen.route, (route) => false
          );
      },
      verificationFailed: (FirebaseAuthException err) {
        print(err.code);
      },
      codeSent: (String verifyId, int forseToken) {
        print('code sent');
      },
      codeAutoRetrievalTimeout: (String verifyId) {}
    );
  }
}