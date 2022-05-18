import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget{
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>{

  String? cityName;
  int? temp2;
  @override
  void initState(){
    super.initState();
    updateData(widget.parseWeatherData); //state class의 속성 widget 사용 모든데이터에 접근 가능
  }
  void updateData(dynamic weatherData){
         double temp = weatherData['main']['temp'];
         temp2 = temp.round(); //반올림 하기 위해
         cityName = weatherData['name'];
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cityName',
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('$temp2',
              style: TextStyle(
                fontSize: 30.0
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
