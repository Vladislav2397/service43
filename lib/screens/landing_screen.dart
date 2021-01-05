import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/sign_up_screen.dart';


class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
	@override
	Widget build(BuildContext context) {
		checkAuth()
			? Navigator.of(context).pushReplacementNamed(HomeScreen.route)
			: Navigator.of(context).pushReplacementNamed(SignUpScreen.route);
		return Center(
			child: CircularProgressIndicator(),
		);
	}
}