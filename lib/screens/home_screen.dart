import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';
import 'package:service43/screens/components/my_logo.dart';
import 'package:service43/screens/map_screen.dart';
import 'package:service43/screens/order_screen.dart';
import 'package:service43/screens/sos_screen.dart';


class HomeScreen extends StatelessWidget {
  static final route = '/home';

  @override
  Widget build(BuildContext context) {
    return auth.currentUser.emailVerified ? Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: MyLogo(appName),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MyButton(
                  btnText: 'Заказать услугу',
                  btnPressFunc: () {
                    Navigator.pushNamed(context, OrderScreen.route);
                  },
                  btnTheme: MyButtonTheme.primary,
                ),
                MyButton(
                  btnText: 'Посмотреть карту',
                  btnPressFunc: () {
                    Navigator.pushNamed(context, MapScreen.route);
                  },
                  btnTheme: MyButtonTheme.primary,
                ),
                MyButton(
                  btnText: 'Экстренный вызов',
                  btnPressFunc: () {
                    Navigator.pushNamed(context, SOSScreen.route);
                  },
                  btnTheme: MyButtonTheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    ) : CircularProgressIndicator();
  }
}
