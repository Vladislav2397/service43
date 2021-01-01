import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:service43/screens/model/employee.dart';

const appName = 'Service43';
const databaseURL = 'https://service43-64544-default-rtdb.firebaseio.com/';
const myPhone = '+7(900)123-45-67';
const myPhoneURL = 'tel://$myPhone';

Future<List<Employee>> fetchEmployee() async {
  var response = await db.child('employes').once();
  List<dynamic> mapEmployes = response.value;

  return mapEmployes.map((obj) => Employee.fromMap(obj)).toList();
}

get employes => fetchEmployee();

DatabaseReference db = FirebaseDatabase.instance.reference();

FirebaseAuth auth = FirebaseAuth.instance;
bool isAuth = auth.currentUser != null;
