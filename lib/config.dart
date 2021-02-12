import 'dart:async';

import 'package:service43/private.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:service43/screens/components/my_snack_bars.dart';

import 'package:service43/screens/model/employee.dart';

const appName = 'Услуги.Киров';
const databaseURL = 'https://service43-64544-default-rtdb.firebaseio.com/';
const errorLabel = 'Ошибка';

const phoneLabel = 'Телефон';
const phoneExample = '79001234567';
const phoneNumber = '+7(900)123-45-67';
const phoneURL = 'tel://$phoneNumber';
const phoneType = TextInputType.number;

const primaryColor = Color(0xFF455A63);
const secondaryColor = Color(0xFF91A4AE);
const accidentalColor = Color(0xFFFF8A64);
const darkColor = Color(0xFF253239);
const darkerColor = Color(0xFF171E21);
const lightColor = Color(0xFFD0D8DC);
const errorColor = Colors.red;

// ignore: deprecated_member_use
final smtpServer = gmail(mailer['email'], mailer['password']);

// Common getters
FirebaseAuth get auth => FirebaseAuth.instance;
User get user => auth.currentUser;
DatabaseReference get db => FirebaseDatabase.instance.reference();
Future<List<Employee>> get employes => fetchEmployee();
Future<List<dynamic>> get services => fetchServices();
bool get isAuth => user != null;

Future<List<Employee>> fetchEmployee() async {
  var response = await db.child('employes').once();
  List<dynamic> mapEmployes = response.value;

  return mapEmployes.map((obj) => Employee.fromMap(obj)).toList();
}

Future<List<dynamic>> fetchServices() async {
  var response = await db.child('services').once();
  return response.value;
}

void checkAndSaveForm(GlobalKey<FormState> formKey) {
  formKey.currentState.validate()
    ? formKey.currentState.save()
    : throw FirebaseAuthException(
      code: 'not-valid-form',
      message: 'The form was not valid'
    );
}

void sendEmail({
  BuildContext context,
  String title,
  String content
}) async {
  final message = Message()
    ..from = Address(mailer['email'])
    ..recipients.add(mailer['recipient'])
    ..subject = title
    ..text = content;
  
  try {
    await send(message, smtpServer);
  } catch (err) {
    mySnackBarText(context, 'Error');
  }
}

String phoneValidator(String value) {
  return value.isEmpty || value.length < 11
    ? 'Введите коректный номер'
    : null;
}

String dropdownValidator(dynamic value) {
  return value == null
    ? 'Выберите услугу из списка'
    : null;
}

String textValidator(String value) {
  return value.isEmpty
    ? 'Введите корректное значение'
    : null;
}