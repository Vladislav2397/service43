import 'package:flutter/material.dart';
import 'package:service43/screens/login_screen.dart';
import 'screens/sos_screen.dart';
import 'screens/home_screen.dart';
import 'screens/order_screen.dart';
import 'screens/map_screen.dart';
// import 'screens/sign_in_screen.dart';

// todo: Create a registration
// * With phone or google
// todo: Reorganized code
// todo: Realized BLoC pattern in app

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/login',
      routes: {
				'/login': (_) => LoginScreen(),
        '/': (_) => HomeScreen(),
        '/order': (_) => OrderScreen(),
        '/map': (_) => MapScreen(),
        '/sos': (_) => SOSScreen(),
        // '/register': (_) => RegisterScreen(),
      },
    );
  }
}
