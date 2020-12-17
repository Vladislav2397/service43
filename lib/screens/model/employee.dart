import 'package:latlong/latlong.dart';

import 'model.dart';

class Employee extends Model {
  String name;
  String work;
  bool isFree;
  double rating;
  LatLng pos;
  dynamic image;

  Employee({this.name, this.work, this.isFree, this.rating, this.pos});

  void fromJson(Map<String, dynamic> json) {}
}
