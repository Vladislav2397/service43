import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/sign_up_screen.dart';
import 'package:service43/screens/policy_privacy.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/order_screen.dart';
import 'package:service43/screens/map_screen.dart';
import 'package:service43/screens/sos_screen.dart';

// todo: In Next Versions 2...

// todo: Open Map screen
// todo: Registration with google

// todo: In Next Version 1.1

// todo: Refactoring code
// todo: Write API for DB
// todo: Realized BLoC pattern in app
// todo: Or scoped model pattern

// todo: In Next Version 1.2
// todo: Add config for IOS system

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  auth.setSettings(
      appVerificationDisabledForTesting: true,
      userAccessGroup: ''
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
          scaffoldBackgroundColor: darkColor,
          buttonColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: accidentalColor
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor)
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: errorColor)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: errorColor)
              ),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              labelStyle: TextStyle(
                  color: Colors.white
              )
          )
      ),
      initialRoute: isAuth ? HomeScreen.route : SignUpScreen.route,
      routes: {
        SignUpScreen.route: (_) => SignUpScreen(),
        PolicyPrivacy.route: (_) => PolicyPrivacy(),
        HomeScreen.route: (_) => HomeScreen(),
        OrderScreen.route: (_) => OrderScreen(),
        MapScreen.route: (_) => MapScreen(),
        SOSScreen.route: (_) => SOSScreen(),
      },
    );
  }
}
