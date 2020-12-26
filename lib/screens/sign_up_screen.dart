import 'package:flutter/material.dart';

import 'log_in_screen.dart';
import 'register_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _tabs = {'Log in': LogInScreen(), 'Register': RegisterScreen()};

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: <Widget>[for (var tab in _tabs.keys) Tab(text: tab)],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Two screen widget for login and register
						for (var tab in _tabs.values) tab
          ],
        ),
      ),
    );
  }
}
