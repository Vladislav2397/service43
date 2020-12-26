import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config.dart';

import 'screens/sign_up_screen.dart';
import 'screens/sos_screen.dart';
import 'screens/home_screen.dart';
import 'screens/order_screen.dart';
import 'screens/map_screen.dart';

// todo: Create a registration
// todo: -> with phone or email or google
// todo: Reorganized code
// todo: Realized BLoC pattern in app

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
      initialRoute: '/signup',
      routes: {
        '/': (_) => HomeScreen(),
        '/signup': (_) => SignUpScreen(),
        '/order': (_) => OrderScreen(),
        '/map': (_) => MapScreen(),
        '/sos': (_) => SOSScreen(),
      },
    );
  }
}
