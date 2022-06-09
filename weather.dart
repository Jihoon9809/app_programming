import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

const apikey = '576d46ee1760bd0dbff8bdb769d6e2dc';
const city ='Busan';

class Weather extends StatefulWidget {
  Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  double? temp;

  Future getWeather() async {
    String url = "https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apikey}";
    var response = await http.get(Uri.parse(url));
    dynamic jsonData = jsonDecode(response.body);
    setState(() {
      temp = jsonData['main']['temp'];

    });
    print(jsonData.toString());
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        child:Text(temp != null ? temp.toString() +"\u00B0":"loding",
        style: TextStyle(fontSize: 40),),
      )
    );
  }
}
