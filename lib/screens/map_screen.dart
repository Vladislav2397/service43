import 'package:flutter/material.dart';

import 'package:service43/config.dart';
import 'package:service43/screens/components/my_map_employes.dart';
import 'package:service43/screens/model/employee.dart';
import 'package:service43/screens/components/my_list_employes.dart';


class MapScreen extends StatefulWidget {
  static final route = '/map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Future<List<Employee>> futureEmployes;

  @override
  void initState() {
    super.initState();
    futureEmployes = employes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: <Widget>[
          Expanded(
              child: FutureBuilder<List<Employee>>(
            future: futureEmployes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MyMapEmployes(snapshot.data);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
          Expanded(
            child: FutureBuilder<List<Employee>>(
              future: futureEmployes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MyListEmployes(snapshot.data);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}