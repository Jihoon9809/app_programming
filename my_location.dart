import 'package:geolocator/geolocator.dart';


class MyLocation{
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async{ // loding 파일의 await 대문에 Future로 설정.
    LocationPermission permission = await Geolocator.requestPermission(); //오류 해결 코드
    Position position = await Geolocator.
    getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude2 = position.latitude;
    longitude2 = position.longitude;
    print(latitude2);
    print(longitude2);
  }
}
