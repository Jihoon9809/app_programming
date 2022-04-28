import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget{
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>{

  late String cityName;
  late double temp;
  @override
  void initState(){
    super.initState();
    print(widget.parseWeatherData);
  }
  void updateData(dynamic weatherData){
         temp = weatherData['main']['temp'];
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
              Text('$temp',
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
