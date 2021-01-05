import 'package:latlong/latlong.dart';

import 'model.dart';

class Employee extends Model {
  // int id;
  String name;
  String job;
  bool isFree;
  // double rating;
  LatLng pos;
  // dynamic image;

  Employee({this.name, this.job, this.isFree, this.pos});

  Employee.fromMap(Map<dynamic, dynamic> map)
      : name = map['name'],
        job = map['job'],
        isFree = map['isFree'],
        pos = LatLng(map['pos'][0], map['pos'][1]);
}