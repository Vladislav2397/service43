import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/sign_up_screen.dart';
import 'package:service43/screens/register_screen.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/order_screen.dart';
import 'package:service43/screens/map_screen.dart';
import 'package:service43/screens/sos_screen.dart';

// todo: registration with phone
// todo: -> or email or google
// todo: Refactoring code
// todo: Realized BLoC pattern in app


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('Auth: $isAuth');
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      initialRoute: isAuth ? '/index' : '/signup',
      routes: {
        '/signup': (_) => SignUpScreen(),
        '/register': (_) => RegisterScreen(),
        '/index': (_) => HomeScreen(),
        '/order': (_) => OrderScreen(),
        '/map': (_) => MapScreen(),
        '/sos': (_) => SOSScreen(),
      },
    );
  }
}
