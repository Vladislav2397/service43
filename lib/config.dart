import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:service43/screens/model/employee.dart';

// todo: Разделить весь файл и подумать
// todo: -> насчет других типов данных
// todo: Переписать некоторые элементы
// todo: -> более правильно

const appName = 'Service43';
const databaseURL = 'https://service43-64544-default-rtdb.firebaseio.com/';
const myPhone = '+7(900)123-45-67';
const myPhoneURL = 'tel://$myPhone';
const emailExample = 'email_12345@domain.com';
const passwordExample = 'password12345';
const DEBUG = false;

DatabaseReference db = FirebaseDatabase.instance.reference();
FirebaseAuth auth = FirebaseAuth.instance;
bool isAuth = auth.currentUser != null;

get authUser => auth.currentUser;
get employes => fetchEmployee();

printDebug(List<String> args) {
  if (DEBUG) {
    for (var arg in args) print(arg);
  }
}

Future<List<Employee>> fetchEmployee() async {
  var response = await db.child('employes').once();
  List<dynamic> mapEmployes = response.value;

  return mapEmployes.map((obj) => Employee.fromMap(obj)).toList();
}

bool checkAuth() {
  User user = auth.currentUser;
  var isRegister = user != null;
  var isVerified = user?.emailVerified ?? false;

  printDebug([
    "User register: $isRegister",
    "User email verified: $isVerified",
    'User email: ${user?.email}'
  ]);

  return isRegister && isVerified;
}