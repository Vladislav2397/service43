import 'package:latlong/latlong.dart';

import 'model.dart';


class Master extends Model {
	String fullName;
	String info;
	bool isFree;
	LatLng pos;

	Master({this.fullName, this.info, this.isFree, this.pos});
}