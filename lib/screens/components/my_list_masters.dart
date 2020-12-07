import 'package:flutter/material.dart';
import '../model/master.dart';


// ignore: must_be_immutable
class MyListMasters extends StatelessWidget {
	List<Master> masters;
	MyListMasters({this.masters});

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: this.masters.length,
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
										this.masters[index].fullName,
										style: TextStyle(
											fontWeight: FontWeight.bold,
											fontSize: 20,
										),
									),
									Text(
										this.masters[index].info,
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