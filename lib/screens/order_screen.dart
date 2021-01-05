import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/sign_up_screen.dart';
import 'package:service43/screens/components/my_dropdown_button.dart';
import 'package:service43/screens/components/my_form_field.dart';
import 'package:service43/screens/components/my_button.dart';
import 'package:service43/screens/sos_screen.dart';


class OrderScreen extends StatelessWidget {
	static final route = HomeScreen.route + '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        child: Form(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: MyDropdownButton(
                      items: [
                        'Сантехнические работы',
                        'Электротехнические работы',
                        'Монтажные работы'
                      ],
                      hintText: 'Выберите услугу',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MyFormField('Улица'),
                        Row(
                          children: <Widget>[
                            Expanded(child: MyFormField('Дом')),
                            SizedBox(width: 30),
                            Expanded(child: MyFormField('Квартира')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MyButton(
                          btnText: 'Заказать услугу',
                          btnPressFunc: this.btnPress,
                          btnTheme: MyButtonTheme.primary,
                        ),
                        MyButton(
                          btnText: 'Заказать звонок',
                          btnPressFunc: () {
                            Navigator.pushNamed(context, SOSScreen.route);
                          },
                          btnTheme: MyButtonTheme.secondary,
                        ),
                        MyButton(
                          btnText: 'Выйти',
                          btnPressFunc: () {
                            auth.signOut();
														if (DEBUG) {
															print('');
														}
                            Navigator
															.of(context)
															.pushNamedAndRemoveUntil(
																SignUpScreen.route, (route) => false
															);
                          },
                          btnTheme: MyButtonTheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  btnPress() {
    print('ButtonPress');
  }
}