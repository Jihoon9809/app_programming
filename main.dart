import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/Weather.dart';
import 'package:news/screens/bottombar.dart';
import 'package:news/screens/login.dart';
import 'package:news/screens/news_app.dart';
import 'package:news/screens/profile.dart';
import 'package:news/screens/singup.dart';
import 'package:news/screens/weather_screen.dart';
import 'screens/Home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: bottom(),
    );
  }
}
