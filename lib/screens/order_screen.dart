import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/base_button.dart';
import 'package:service43/screens/components/my_snack_bars.dart';
import 'package:service43/screens/components/my_text_form_field.dart';
import 'package:service43/screens/home_screen.dart';
import 'package:service43/screens/sos_screen.dart';


class _OrderData {
  String _job;
  String _area = '';
  String _street = '';
  String _house = '';
  String _room = '';
  List<String> _services;

  String get job => this._job;
  String get area => this._area;
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

  set job(String value) {
    this._job = value.trim().toString();
  }

  set area(String value) {
    this._area = value.trim().toString();
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

class OrderScreen extends StatelessWidget {
  static final route = HomeScreen.route + '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: services,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) return _OrderForm(snapshot.data);
          else return Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}

class _OrderForm extends StatefulWidget {
  final List dropdownValues;

  _OrderForm(this.dropdownValues);

  @override
  __OrderFormState createState() => __OrderFormState();
}

class __OrderFormState extends State<_OrderForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = _OrderData();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    dropdownColor: darkerColor,
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
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: errorColor
                        )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: errorColor
                        )
                      ),
                    ),
                    value: _data.job,
                    items: getDropdownItems(widget.dropdownValues),
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
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyTextFormField(
                    labelText: 'Район',
                    validator: textValidator,
                    onSaved: (String value) {
                      _data._area = value;
                    },
                  ),
                  SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Улица',
                    validator: textValidator,
                    onSaved: (String value) {
                      _data.street = value;
                    },
                  ),
                  SizedBox(height: 10),
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
                      SizedBox(width: 20),
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
                  SizedBox(height: 15),
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
    );
  }

  List<DropdownMenuItem<dynamic>> getDropdownItems(List values) {
    return values.map(
      (e) => DropdownMenuItem(
        value: e,
        child: Text(e)
      )
    ).toList();
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
      mySnackBarTextError(context);
    }
  }
}
