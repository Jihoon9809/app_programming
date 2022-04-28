import 'package:flutter/material.dart';
import 'package:news/data/my_location.dart';
import 'package:news/data/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/screens/weather_screen.dart';

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
    getLocation();
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=${latitude3}&lon=${longitude3}&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseWeatherData: weatherData,);
    }));
  }

  // void fetchDate() async{
  //

  //   }
  // }

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
