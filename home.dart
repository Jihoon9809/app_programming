import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final home_logo = Text( //어플 로고이미지로 변경
      "News",
      style: TextStyle(
          color: Colors.black),
    );
    final Leading_button = IconButton( onPressed: () {print("검색버튼");},icon: Icon(Icons.search), color: Colors.grey,);

    final current_location = Text(
      "현재 주소 \n 기온",
      style: TextStyle( // 위도 및 경로를 활용하여 현위치 이름으로 변경.
          height: 2.2,
          fontSize: 13,
          color: Colors.black),
    );


    Widget _bodyWidget() {
      return ListView.separated(itemBuilder: (BuildContext _context, int
      index) {
        return Container(
          child: Column(
            children: [
              Image.asset("assets/images/ara-${index + 1}.jpg",
                width: 500,
                height: 200,
              ),
              Container(
                  child: Column(
                    children: [
                      Text("기사글 들어갈 공간")
                    ],
                  ))
            ],
          ),
        );
      },
        itemCount: 10
        ,
        separatorBuilder: (BuildContext _context, int
        index) {
          return Container(height: 1, color: Colors.black.withOpacity(0.4));
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: home_logo,
          centerTitle: true,
          leading: Leading_button,
          actions: <Widget>[ IconButton(onPressed: (){print("문의사항 이동");}, icon: Icon(Icons.info),color: Colors.grey,),
            IconButton(onPressed: (){print("세팅 이동");}, icon: Icon(Icons.settings),color: Colors.grey,),
      ],
    ),body
    :
    _bodyWidget
    (
    )
    ,
    );
  }
}
