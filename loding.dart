import 'package:flutter/material.dart';
import 'package:news/data/my_location.dart';
import 'package:news/data/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/screens/weather_screen.dart';

import 'Home.dart';

const apikey = '576d46ee1760bd0dbff8bdb769d6e2dc';

class Loading extends StatefulWidget{
  @override
  _LoadingState createState()=> _LoadingState();
}

class _LoadingState extends State<Loading>{

  late double latitude3;
  late double longitude3;

  @override
  void initState(){
    super.initState();
    getLocation(); //앱 실행시 위도 경도 찾기
  }

  // getLocation 함수를 통하여 위도 경도를 다운받는다.
  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation(); // 위도와 경도값이 리턴되는 것을 기다려야 하므로 await 적용.
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;

    //데이터 가져오기.
    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=${latitude3}&lon=${longitude3}&appid=$apikey&units=metric');

    /*var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Home(parseWeatherData: weatherData,);
    }));*/
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: null,
            child: Text(
              'Get my location',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Colors.blue,
          ),
        )
    );
  }
}
