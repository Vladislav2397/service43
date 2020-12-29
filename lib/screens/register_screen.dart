import 'package:flutter/material.dart';

import 'package:service43/screens/components/my_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool policyAnonymous = false;
  var phoneNumberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Register",
              style: TextStyle(
                  color: Colors.green[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(height: 30),
            Text("Для регистрации пожалуйста укажите ваш номер телефона"),
            TextFormField(
              controller: phoneNumberCtrl,
              decoration: InputDecoration(hintText: "Ваш номер телефона"),
            ),
            SizedBox(height: 15),
            MyButton(
              btnText: "Зарегистрироваться",
              btnPressFunc: () async {
                try {

                } catch (e) {
                  print(e);
                }
              },
              btnTheme: MyButtonTheme.primary,
            ),
            SizedBox(height: 15),
            Row(children: [
              Checkbox(
                value: policyAnonymous,
                onChanged: (val) {
                  setState(() {
                    policyAnonymous = val;
                  });
                },
              ),
              Text("Я принимаю\nполитикy конфиденциальности")
            ]),
          ],
        ),
      ),
    );
  }

  void signUp(String phone) async {}
}
