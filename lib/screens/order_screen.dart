import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/base_button.dart';
import 'package:service43/screens/components/my_snack_bars.dart';
import 'package:service43/screens/components/my_text_form_field.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/sos_screen.dart';


class _OrderData {
  String _job;
  String _street = '';
  String _house = '';
  String _room = '';
  List<String> _jobs = [
    'Сантехнические работы',
    'Электротехнические работы',
    'Монтажные работы'
  ];

  String get job => this._job;
  String get street => this._street;
  String get house => this._house;
  String get room => this._room;
  String get sendMessage => 
    '''
      Пользователь: ${user?.phoneNumber}
      Услуга: $job
      Улица: $street
      Дом: $house
      Квартира: $room
    ''';

  // ? Подумать насчет читаемости
  List<DropdownMenuItem<String>> get jobs =>
    this._jobs.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();


  set job(String value) {
    this._job = value.trim().toString();
  }

  set street(String value) {
    this._street = value.trim().toString();
  }
  
  set house(String value) {
    this._house = value.trim().toString();
  }
  
  set room(String value) {
    this._room = value.trim().toString();
  }
}


class OrderScreen extends StatefulWidget {
  static final route = HomeScreen.route + '/order';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _formKey = GlobalKey<FormState>();
  var _data = _OrderData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: DropdownButtonFormField(
                      hint: Text(
                        'Выберите услугу',
                        style: TextStyle(
                          color: secondaryColor
                        ),
                      ),
                      dropdownColor: primaryColor,
                      focusColor: secondaryColor,
                      iconEnabledColor: secondaryColor,
                      style: TextStyle(
                        color: secondaryColor
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor
                          )
                        )
                      ),
                      value: _data.job,
                      items: _data.jobs,
                      onChanged: (dynamic value) {
                        _data.job = value;
                      },
                      validator: dropdownValidator,
                      onSaved: (dynamic value) {
                        _data.job = value;
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MyTextFormField(
                      labelText: 'Улица',
                      validator: textValidator,
                      onSaved: (String value) {
                        _data.street = value;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MyTextFormField(
                            labelText: 'Дом',
                            validator: textValidator,
                            onSaved: (String value) {
                              _data.house = value;
                            },
                          ),
                        ),
                        SizedBox(width: 30),
                        Expanded(
                          child: MyTextFormField(
                            inputType: TextInputType.number,
                            labelText: 'Квартира',
                            validator: textValidator,
                            onSaved: (String value) {
                              _data.room = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25, vertical: 10
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BaseButton(
                      text: 'Заказать услугу',
                      onPressed: this.sendRequest,
                    ),
                    SizedBox(height: 20),
                    BaseButton(
                      text: 'Заказать звонок',
                      color: accidentalColor,
                      onPressed: () {
                        Navigator.pushNamed(context, SOSScreen.route);
                      },
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  sendRequest() async {
    try {
      checkAndSaveForm(_formKey);
      sendEmail(
        title: 'Service43 - Заказ',
        content: _data.sendMessage
      );
      mySnackBarTextSuccess(context);
    } catch (err) {
      mySnackBarTextSuccess(context);
    }
  }
}