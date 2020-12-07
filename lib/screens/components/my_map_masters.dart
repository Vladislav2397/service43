import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../model/master.dart';


// ignore: must_be_immutable
class MyMapMasters extends StatelessWidget {
	List<Master> masters;
	MyMapMasters({this.masters});

	String url = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";

	List<Marker> _getMarkers() {
		List<Marker> markers = [];
		for (Master master in this.masters) {
			markers.add(Marker(
				point: master.pos,
				builder: (ctx) {
					return Container(
						child: Icon(
							Icons.location_on,
							color: master.isFree ? Colors.green[800] : Colors.red[800],
							size: 50,
						),
					);
				}
			));
		}
		return markers;
	}

	@override
	Widget build(BuildContext context) {
		return FlutterMap(
			key: Key("flutter_map"),
			options: MapOptions(
				center: LatLng(58.59665, 49.66007),
				zoom: 13,
			),
			layers: [
				new TileLayerOptions(
					urlTemplate: this.url, subdomains: ['a', 'b', 'c']),
				new MarkerLayerOptions(
					key: Key("flutter_map_layer"),
					markers: this._getMarkers(),
				)
			],
		);
	}
}