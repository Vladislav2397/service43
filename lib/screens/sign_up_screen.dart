import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/base_button.dart';
import 'package:service43/screens/components/my_logo.dart';
import 'package:service43/screens/components/my_snack_bars.dart';
import 'package:service43/screens/components/my_text_form_field.dart';
import 'package:service43/screens/home_screen.dart';


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
  var smsCodeCtrl = TextEditingController();
  String verificationId;

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
              SizedBox(height: 100),
              MyTextFormField(
                inputType: phoneType,
								hintText: phoneExample,
								labelText: phoneLabel,
                validator: phoneValidator,
                onSaved: (String value) {
                  _data.phone = value;
                },
              ),
              SizedBox(height: 50),
              BaseButton(
                text: 'Войти',
                onPressed: () {
                  try {
                    checkAndSaveForm(_formKey);
                    signUp(context, _data.phone);
                  } catch (err) {
                    mySnackBarText(context, 'Вход не удался');
                    print(err);
                  }
                },
              ),
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
        mySnackBarText(context, err.code);
        print(err.code);
      },
      codeSent: (String verifyId, int forseToken) async {
        this.verificationId = verifyId;
        
        String smsCode = await getSmsCode(context);
        if (smsCode.isNotEmpty && smsCode != null) {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: this.verificationId, smsCode: smsCode
          );
          await auth.signInWithCredential(credential);
          isAuth
            ? Navigator.of(context).pushReplacementNamed(HomeScreen.route)
            : mySnackBarText(context, 'Error');
        } else {
          return;
        }
      },
      codeAutoRetrievalTimeout: (String verifyId) {
        this.verificationId = verifyId;
      }
    );
  }

  Future<String> getSmsCode(BuildContext context) {
    String smsCode;
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SMS код'),
          content: TextField(
            onChanged: (value) {
              smsCode = value;
            },
          ),
          contentPadding: EdgeInsets.all(10),
          actions: <Widget>[
            FlatButton(
              child: Text('Подтвердить'),
              onPressed: () {
                Navigator.of(context).pop(smsCode);
              },
            )
          ],
        );
      },
    );
  }
}