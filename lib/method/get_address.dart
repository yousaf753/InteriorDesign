import 'package:geolocator/geolocator.dart';
import 'location_permission.dart';
import 'location_service.dart';
Future<Position?> determineCurrentPosition() async{
  try{
    await locationPermissionCheck();
    await locationServiceCheck();
    return await Geolocator.getCurrentPosition();
  }catch (e){
    return null;
  }
}