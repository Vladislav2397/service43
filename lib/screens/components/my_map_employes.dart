import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:service43/screens/model/employee.dart';


class MyMapEmployes extends StatefulWidget {
  final List<Employee> employes;
  MyMapEmployes(this.employes);

  @override
  _MyMapEmployesState createState() => _MyMapEmployesState();
}

class _MyMapEmployesState extends State<MyMapEmployes> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(58.59665, 49.66007);
  List<Marker> _markers;
  // final List<Marker> _markers = [
  //   Marker(
  //     markerId: MarkerId("1mark"),
  //     position: LatLng(58.59665, 49.66007),
  //     icon: BitmapDescriptor.defaultMarker,
  //     infoWindow: InfoWindow(
  //       title: "name",
  //       snippet: "the work"
  //     )
  //   ),
  // ];

  Future<void> _onMapCreated(GoogleMapController ctrl) async {}

  @override
  Widget build(BuildContext context) {
		this._markers = [
			for (var emp in widget.employes)
				Marker(
					markerId: MarkerId('${emp.id}'),
					position: emp.pos,
					icon: BitmapDescriptor.defaultMarker,
					infoWindow: InfoWindow(
						title: emp.name,
						snippet: emp.job
					)
				)
		];
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: _center, zoom: 13.0),
      onMapCreated: _onMapCreated,
      markers: _markers.toSet(),
      mapToolbarEnabled: true,
    );
  }
}
