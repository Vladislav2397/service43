import 'package:flutter/material.dart';
import '../model/employee.dart';


class MyListEmployes extends StatelessWidget {
  final List<Employee> employes;

  MyListEmployes(this.employes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.employes.length,
      itemBuilder: (ctx, index) {
        return Row(
          children: <Widget>[
            Container(
              width: 75,
              height: 75,
              child: Center(
                child: Image(
                  image: AssetImage("assets/images/user.jpg"),
                  width: 75,
                  height: 75,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    this.employes[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    this.employes[index].work,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}