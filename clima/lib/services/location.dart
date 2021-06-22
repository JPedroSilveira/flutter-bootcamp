import 'package:clima/types/location.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _singleton = LocationService._internal();

  factory LocationService() {
    return _singleton;
  }

  LocationService._internal();

  Future<Location?> getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      return null;
    }
  }
}
