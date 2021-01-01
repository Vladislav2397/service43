import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';


Future<List<Master>> fetchMaster() async {
	final response =
			await http.get('https://nameless-cliffs-62309.herokuapp.com/service43');

	var json = response.body;
	List<Master> masters = [];

	if (response.statusCode == 200) {
		for (var master in jsonDecode(json)) {
			masters.add(
				Master(
					fullname: master['fullName'],
					info: master['info'],
					isFree: master['isFree'],
					pos: LatLng(
						master['pos'][0],
						master['pos'][1],
					)
				)
			);
		}
		return masters;
	} else {
		throw Exception('Failed to load album');
	}
}

class Master {
	final String fullname;
	final String info;
	final bool isFree;
	final LatLng pos;

	Master({this.fullname, this.info, this.isFree, this.pos});

	factory Master.fromJson(Map<String, dynamic> json) {
		return Master(
				fullname: json['fullname'],
				info: json['info'],
				isFree: json['isFree'],
				pos: LatLng(json['pos'][0], json['pos'][1]));
	}
}

class MyApp extends StatefulWidget {
	MyApp({Key key}) : super(key: key);

	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	Future<List<Master>> futureMaster;

	@override
	void initState() {
		super.initState();
		futureMaster = fetchMaster();
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Fetch Data Example',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: Scaffold(
				appBar: AppBar(
					title: Text('Fetch Data Example'),
				),
				body: Center(
					child: FutureBuilder<List<Master>>(
						future: futureMaster,
						builder: (context, snapshot) {
							if (snapshot.hasData) {
								return ListView.builder(
									itemCount: snapshot.data.length,
									itemBuilder: (ctx, index) {
										return Row(
											children: <Widget>[
												Container(
													width: 75,
													height: 75,
													child: Center(
														child: Image(
															image: AssetImage('assets/images/user.jpg'),
															width: 75,
															height: 75,
														),
													),
												),
												Expanded(
													child: Column(
														children: <Widget>[
															Text(
																snapshot.data[index].fullname,
																style: TextStyle(
																	fontWeight: FontWeight.bold,
																	fontSize: 20,
																),
															),
															Text(
																snapshot.data[index].info,
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
							} else {
								return Text('${snapshot.error}');
							}
						},
					),
				),
			),
		);
	}
}