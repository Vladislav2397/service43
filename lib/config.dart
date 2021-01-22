import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:service43/screens/components/my_snack_bars.dart';

import 'package:service43/screens/model/employee.dart';

const appName = 'Service43';
const databaseURL = 'https://service43-64544-default-rtdb.firebaseio.com/';
const myPhone = '+7(900)123-45-67';
const myPhoneURL = 'tel://$myPhone';
const emailExample = 'email_12345@domain.com';
const passwordExample = 'password12345';

const phoneLabel = 'Телефон';
const phoneExample = '+79001234567';
const phoneNumber = '+7(900)123-45-67';
const phoneURL = 'tel://$phoneNumber';
const phoneType = TextInputType.number;

const primaryColor = Color(0xFF455A63);
const secondaryColor = Color(0xFF91A4AE);
const accidentalColor = Color(0xFFFF8A64);
const darkColor = Color(0xFF253239);
const lightColor = Color(0xFFD0D8DC);

const mailer = {
  'email': 'vladislav2397service43@gmail.com',
  'password': '19@oXu*Ztt',
  'recipient': 'valdiszz53@gmail.com',
};

// ignore: deprecated_member_use
final smtpServer = gmail(mailer['email'], mailer['password']);

const DEBUG = true;

// Common getters
FirebaseAuth get auth => FirebaseAuth.instance;
User get user => auth.currentUser;
DatabaseReference get db => FirebaseDatabase.instance.reference();
Future<List<Employee>> get employes => fetchEmployee();
bool get isAuth => user != null;

printDebug({List<String> listData, String title}) {
  if (DEBUG) {
    if (title != null) print(title);
    for (var arg in listData) print(arg);
  }
}

Future<List<Employee>> fetchEmployee() async {
  var response = await db.child('employes').once();
  List<dynamic> mapEmployes = response.value;

  return mapEmployes.map((obj) => Employee.fromMap(obj)).toList();
}

void checkAndSaveForm(GlobalKey<FormState> formKey) {
  formKey.currentState.validate()
    ? formKey.currentState.save()
    : throw FirebaseAuthException(
			code: 'not-valid-form',
			message: 'The form was not valid');
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
		mySnackBarText(context, err);
  }
}

String phoneValidator(String value) {
  return value.isEmpty || value.length <= 5
    ? 'Введите коректный пароль'
    : null;
}

String dropdownValidator(dynamic value) {
  return value == null
    ? 'Выберите услугу из списка'
    : null;
}