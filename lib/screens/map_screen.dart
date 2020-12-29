import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;

import 'package:service43/screens/components/my_map_employes.dart';
import 'package:service43/screens/model/employee.dart';
import 'package:service43/screens/components/my_list_employes.dart';

class MapScreen extends StatefulWidget {
	@override
	_MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
	Future<List<Employee>> futureEmployes;
	@override
	void initState() {
		super.initState();
		futureEmployes = fetchEmployee();
	}

	Future<List<Employee>> fetchEmployee() async {
		String url = 'https://nameless-cliffs-62309.herokuapp.com/service43';
		final response = await http.get(url);

		var jsonEmployes = response.body;
		List<Employee> employes = [];

		if (response.statusCode == 200) {
			for (var employee in jsonDecode(jsonEmployes)) {
				employes.add(
					Employee(
						name: employee['fullName'],
						work: employee['info'],
						isFree: employee['isFree'],
						rating: employee['rating'],
						pos: LatLng(
							employee['pos'][0],
							employee['pos'][1],
						)
					)
				);
			}
			return employes;
		} else { throw Exception('Failed to load employes'); }
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