import 'package:flutter/material.dart';
import 'package:service43/screens/components/base_button.dart';
import 'package:service43/screens/components/my_snack_bars.dart';
import 'package:service43/screens/components/my_text.dart';
import 'package:service43/screens/components/my_text_form_field.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:service43/config.dart';


class _SOSData {
  String _phone = '';

  String get phone => this._phone;
  String get sendMessage => 'Номер: $phone';

  set phone(String value) => this._phone = value.toString().trim();
}


class SOSScreen extends StatefulWidget {
  static final route = HomeScreen.route + '/sos';

  @override
  _SOSScreenState createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  final _data = _SOSData();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyTextFormField(
                      initialValue: user?.phoneNumber ?? '7',
                      validator: phoneValidator,
                      onSaved: (String value) {
                        _data.phone = '+' + value;
                      },
                    ),
                    MyText(
                      'Оставьте свой номер для\nобратного вызова',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    BaseButton(
                      text: 'Оставить',
                      onPressed: _sendNumber,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: Colors.white)),
                  MyText(
                    'или',
                    fontSize: 18,
                  ),
                  Expanded(child: Divider(color: Colors.white)),
                ]
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MyText(
                      'Позвоните нам',
                      fontSize: 18
                    ),
                    SizedBox(height: 10),
                    MyText(
                      phoneNumber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    SizedBox(height: 30),
                    BaseButton(
                      text: 'Позвонить',
                      color: accidentalColor,
                      onPressed: this._launchCaller,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendNumber() {
    try {
      checkAndSaveForm(_formKey);
      sendEmail(
        context: context,
        title: 'Service43 - Заявка на обратный вызов',
        content: _data.sendMessage
      );
      mySnackBarTextSuccess(context);
    } catch (err) {
      mySnackBarTextError(context);
    }
  }

  void _launchCaller() async {
    if (await canLaunch(phoneURL))
      await launch(phoneURL);
    else
      throw 'Could not launch $phoneURL';
  }
}