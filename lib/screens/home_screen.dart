import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/base_button.dart';
import 'package:service43/screens/components/my_logo.dart';
import 'package:service43/screens/components/my_snack_bars.dart';
// import 'package:service43/screens/map_screen.dart';
import 'package:service43/screens/order_screen.dart';
import 'package:service43/screens/sos_screen.dart';


class HomeScreen extends StatefulWidget {
  static final route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                appName,
                style: Theme.of(context).textTheme.headline1
              ),
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
                    text: 'Заказать услугу',
                    onPressed: navigation(OrderScreen.route),
                  ),
                  // BaseButton(
                  //   text: 'Посмотреть карту',
                  //   onPressed: () {
                  //     mySnackBarText(context, 'В разработке');
                  //     // Navigator.pushNamed(context, MapScreen.route);
                  //   },
                  // ),
                  BaseButton(
                    text: 'Экстренный вызов',
                    color: accidentalColor,
                    onPressed: navigation(SOSScreen.route),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  navigation(String route) {
    return () => Navigator.of(context).pushNamed(route);
  }
}
