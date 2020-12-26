import 'package:firebase_auth/firebase_auth.dart';

const appName = 'Service43';
const databaseURL = 'https://service43-64544-default-rtdb.firebaseio.com/';

FirebaseAuth auth = FirebaseAuth.instance;
bool isSignUp = auth.currentUser != null;
