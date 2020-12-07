import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

import 'components/my_list_masters.dart';
import 'components/my_map_masters.dart';
import 'model/master.dart';


// ignore: must_be_immutable
class MapScreen extends StatelessWidget {

	List<Master> _masters = [
		Master(
			fullName: "Alex",
			info: "The cleaner",
			isFree: true,
			pos: LatLng(58.59670, 49.66010)
		),
		Master(
			fullName: "Oleg",
			info: "The proger",
			isFree: true,
			pos: LatLng(58.59665, 49.65500)
		),
		Master(
			fullName: "Pavel",
			info: "The abs",
			isFree: true,
			pos: LatLng(58.59665, 49.65000)
		),
		Master(
			fullName: "Igor",
			info: "The observer",
			isFree: true,
			pos: LatLng(58.59205, 49.65680)
		),
		Master(
			fullName: "Alex",
			info: "The cleaner",
			isFree: true,
			pos: LatLng(58.60670, 49.64010)
		),
		Master(
			fullName: "Oleg",
			info: "The proger",
			isFree: true,
			pos: LatLng(58.60665, 49.68500)
		),
		Master(
			fullName: "Pavel",
			info: "The abs",
			isFree: true,
			pos: LatLng(58.60665, 49.66000)
		),
		Master(
			fullName: "Igor",
			info: "The observer",
			isFree: true,
			pos: LatLng(58.60205, 49.67680)
		),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white70,
			body: Column(
				children: <Widget>[
					Expanded(
						child: MyMapMasters(
							masters: this._masters
						),
					),
					Expanded(
						child: MyListMasters(
							masters: this._masters
						),
					),
				],
			),
		);
	}
}