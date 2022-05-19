import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailview extends StatefulWidget {
  Detailview({Key? key}) : super(key: key);

  @override
  _DetailviewState createState() => _DetailviewState();
}

class _DetailviewState extends State<Detailview> {
  Widget _appbarWidget(){
    return Container();
  }
  Widget _bodyWidget(){
    return Container();
  }

  final home_logo = Text( //어플 로고이미지로 변경
    "News",
    style: TextStyle(
        color: Colors.black),
  );
  final Leading_button = IconButton( onPressed: () {Navigator.pop(context);},icon: Icon(Icons.west), color: Colors.grey,);

  final Info_button = IconButton(onPressed: (){print("문의사항 이동");}, icon: Icon(Icons.info),color: Colors.grey,);

  final current_location = Text(
    "현재 주소 \n 기온",
    style: TextStyle( // 위도 및 경로를 활용하여 현위치 이름으로 변경.
        height: 2.2,
        fontSize: 13,
        color: Colors.black),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: home_logo,
        centerTitle: true,
        leading: Leading_button,
        actions: <Widget>[ Info_button,
        ],),
      body: _bodyWidget(),
    );
  }
}
