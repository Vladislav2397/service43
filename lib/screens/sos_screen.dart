import 'package:flutter/material.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';


class SOSScreen extends StatelessWidget {
  static final route = HomeScreen.route + '/sos';
  final phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Form(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: phoneCtrl,
                        decoration: InputDecoration(
                          hintText: myPhone
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  Text('Оставьте свой номер для'),
                  Text('обратного вызова'),
                  SizedBox(height: 30),
                  MyButton(
                    btnText: 'Оставить',
                    btnPressFunc: () {},
                    btnTheme: MyButtonTheme.primary,
                  )
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(child: Divider(color: Colors.black)),
              Text(
                'или',
                style: TextStyle(fontSize: 18),
              ),
              Expanded(child: Divider(color: Colors.black)),
            ]),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Позвоните нам', style: TextStyle(fontSize: 18)),
                  Text(myPhone,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  MyButton(
                    btnText: 'Позвонить',
                    btnPressFunc: () {
                      this._launchCaller();
                    },
                    btnTheme: MyButtonTheme.secondary,
                  )
                ],
              ),
            ),
          ],
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