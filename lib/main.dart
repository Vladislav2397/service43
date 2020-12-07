import 'package:flutter/material.dart';
import 'screens/sos_screen.dart';
import 'screens/home_screen.dart';
import 'screens/order_screen.dart';
import 'screens/map_screen.dart';


// TODO: Create a registration
// * With phone or google
// TODO: Linked this app with server


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			initialRoute: '/',
			routes: {
				'/': (_) => HomeScreen(),
				'/order': (_) => OrderScreen(),
				'/map': (_) => MapScreen(),
				'/sos': (_) => SOSScreen(),
			},
		);
	}
}