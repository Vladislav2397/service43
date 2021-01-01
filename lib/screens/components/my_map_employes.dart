import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../model/employee.dart';


class MyMapEmployes extends StatefulWidget {
  final List<Employee> employes;
  MyMapEmployes(this.employes);

  @override
  _MyMapEmployesState createState() => _MyMapEmployesState();
}

class _MyMapEmployesState extends State<MyMapEmployes> {
  String url = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

  List<Marker> _getMarkers() {
    List<Marker> markers = [];
    for (Employee employee in this.widget.employes) {
      markers.add(Marker(
        point: employee.pos,
        builder: (ctx) {
          return Container(
            child: Icon(
              Icons.location_on,
              color: employee.isFree ? Colors.green[800] : Colors.red[800],
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
      key: Key('flutter_map'),
      options: MapOptions(
        center: LatLng(58.59665, 49.66007),
        zoom: 13,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: this.url, subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          key: Key('flutter_map_layer'),
          markers: this._getMarkers(),
        )
      ],
    );
  }
}