import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_button.dart';

class HomeScreen extends StatelessWidget {
	static final route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                auth.currentUser == null ? 'unknown' : appName,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
            ),
          ),
          SizedBox(
            height: 50,
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
                    Navigator.pushNamed(context, '/order');
                  },
                  btnTheme: MyButtonTheme.primary,
                ),
                MyButton(
                  btnText: 'Посмотреть карту',
                  btnPressFunc: () {
                    Navigator.pushNamed(context, '/map');
                  },
                  btnTheme: MyButtonTheme.primary,
                ),
                MyButton(
                  btnText: 'Экстренный вызов',
                  btnPressFunc: () {
                    Navigator.pushNamed(context, '/sos');
                  },
                  btnTheme: MyButtonTheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}