import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/base_button.dart';
import 'package:service43/screens/components/my_logo.dart';
import 'package:service43/screens/map_screen.dart';
import 'package:service43/screens/order_screen.dart';
import 'package:service43/screens/sos_screen.dart';


class HomeScreen extends StatelessWidget {
  static final route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BaseButton(
                    isLong: true,
                    text: 'Заказать услугу',
                    textSize: 20,
                    onPressed: () {
                      Navigator.pushNamed(context, OrderScreen.route);
                    },
                  ),
                  BaseButton(
                    isLong: true,
                    text: 'Посмотреть карту',
                    textSize: 20,
                    onPressed: () {
                      Navigator.pushNamed(context, MapScreen.route);
                    },
                  ),
                  BaseButton(
                    isLong: true,
                    text: 'Экстренный вызов',
                    color: accidentalColor,
                    textSize: 20,
                    onPressed: () {
                      Navigator.pushNamed(context, SOSScreen.route);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
