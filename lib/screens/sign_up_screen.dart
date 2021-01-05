import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';
import 'package:service43/screens/components/my_logo.dart';
import 'package:service43/screens/components/my_snack_bars.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/register_screen.dart';


class LoginData {
  var _email = '';
  var _password = '';

  get email => this._email;
  set email(String value) => this._email = value.toString().trim();

  get password => this._password;
  set password(String value) => this._password = value.toString().trim();
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
                keyboardType: TextInputType.emailAddress,
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
                _data.email = value;
              },
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: passwordExample,
                  labelText: 'Password'
                ),
                validator: (String value) {
                return value.isEmpty || value.length <= 5
                  ? 'Please enter correct passoword'
                  : null;
              },
                onSaved: (String value) {
                _data.password = value;
              },
              ),
              SizedBox(height: 30),
              MyButton(
                btnText: 'Войти',
                btnPressFunc: () {
                  printDebug([
                    'Is form validate:'
                    ' ${_formKey.currentState.validate()}'
                  ]);
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    printDebug([
                      'Saved email text: ${_data.email}',
                      'Saved password text: ${_data.password}'
                    ]);
                    signUp(_data.email, _data.password, context);
                  }
              },
                btnTheme: MyButtonTheme.primary,
              ),
              SizedBox(height: 15),
              MyButton(
                btnText: 'Зарегестрироваться',
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

  void signUp(String email, String password, BuildContext context) async {

    // todo: Разделить эту функцию

    try {
      await auth.signInWithEmailAndPassword(
        email: email, password: password
      );
      if (!auth.currentUser.emailVerified) {
        mySnackBarWithButton(
          context,
          content: 'Email не верифицирован', 
          buttonText: 'Отправить',
          buttonPressFunc: () async {
            await auth.currentUser.sendEmailVerification();
          }
        );
        auth.currentUser.sendEmailVerification();
      } else {
        Navigator
          .of(context)
          .pushNamedAndRemoveUntil(
            HomeScreen.route, (route) => false
          );
      }
    } on FirebaseAuthException catch (err) {
      var message = 'Error';
      switch (err.code) {
        case 'invalid-email':
          message = 'Адрес электронной почты недействителен';
          break;
        case 'user-disabled':
          message = 'Пользователь, соответствующий данному'
                    ' адресу электронной почты, отключен';
          break;
        case "wrong-password":
          message = 'Пароль недействителен для данного'
                    ' адреса электронной почты';
          break;
        case "user-not-found":
          message = 'Нет пользователя, соответствующего'
                    ' данному адресу электронной почты';
          break;
      }
      mySnackBarText(context, message);
      printDebug([message]);
    } catch (err) {
      print(err);
    }
  }
}