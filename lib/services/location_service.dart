import 'package:geolocator/geolocator.dart';

class LocationService {
  double _latitude;
  double _longitude;

  LocationService();

  Future<void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // print(position);

      _latitude = position.latitude;
      _longitude = position.longitude;

    } catch (e) {
      print('Erornya: $e');
    }
  }

  double getLatitude(){
    return this._latitude;
  }

  double getLongitude(){
    return this._longitude;
  }

}
