import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/sign_up_screen.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/order_screen.dart';
import 'package:service43/screens/map_screen.dart';
import 'package:service43/screens/sos_screen.dart';

// todo:>>> In Next Versions

// todo: Registration with google
// todo: Refactoring code
// todo: Realized BLoC pattern in app
// todo: Or scoped model pattern
// todo: Theme from main Scaffold

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        scaffoldBackgroundColor: darkColor,
        buttonColor: Colors.white
      ),
      initialRoute: HomeScreen.route,
      // initialRoute: isAuth
      //   ? HomeScreen.route
      //   : SignUpScreen.route,

      routes: {
        SignUpScreen.route:   (_) => SignUpScreen(),
        HomeScreen.route:     (_) => HomeScreen(),
        OrderScreen.route:    (_) => OrderScreen(),
        MapScreen.route:      (_) => MapScreen(),
        SOSScreen.route:      (_) => SOSScreen(),
      },
    );
  }
}
