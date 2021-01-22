import 'package:flutter/material.dart';
import 'package:service43/screens/components/base_button.dart';
import 'package:service43/screens/components/my_text.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:service43/config.dart';


class SOSScreen extends StatelessWidget {
  static final route = HomeScreen.route + '/sos';
  final phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                    MyText(
                      'Оставьте свой номер для\nобратного вызова',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    BaseButton(
                      text: 'Оставить',
                      onPressed: () {
                        sendEmail(
                          context: context,
                          title: 'Service43 - Заявка на обратный вызов',
                          content: 'Номер: ${user?.phoneNumber}'
                        );
                      },
                    )
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(child: Divider(color: Colors.white)),
                MyText(
                  'или',
                  fontSize: 18,
                ),
                Expanded(child: Divider(color: Colors.white)),
              ]),
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
                      myPhone,
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

  void _launchCaller() async {
    if (await canLaunch(myPhoneURL))
      await launch(myPhoneURL);
    else
      throw 'Could not launch $myPhoneURL';
  }
}