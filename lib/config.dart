import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

const appName = 'Service43';
const databaseURL = 'https://service43-64544-default-rtdb.firebaseio.com/';
const myPhone = '+7(900)123-45-67';
const myPhoneURL = 'tel://$myPhone';

FirebaseDatabase _database = FirebaseDatabase(databaseURL: databaseURL);
DatabaseReference db = _database.reference();

FirebaseAuth auth = FirebaseAuth.instance;
bool isAuth = auth.currentUser != null;
