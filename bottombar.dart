import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/screens/Home.dart';
import 'package:news/screens/login.dart';
import 'package:news/screens/profile.dart';

class bottom extends StatefulWidget {
  bottom({Key? key}) : super(key: key);

  @override
  _bottomState createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  //List<Map<String,String>> datas =[];
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 1;
  }

  @override
  Widget build(BuildContext context) {

    Widget _bodyWidget(){
      switch (_currentPageIndex){
        case 0:
          return Home();
          break;
        case 1:
          return LoginPage();
          break;
      }
      return Container();
    }


    BottomNavigationBarItem _bottomNavigationBarItem(
        String iconName, String label) {
      return BottomNavigationBarItem(
        icon:Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset("assets/svg/${iconName}_off.svg",width:22),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset("assets/svg/${iconName}_on.svg",width:22),
        ),
        label: label,
      );
    }

    Widget _bottomNavigationBarwidget(){
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //설정 하지않으면 아이콘 누를경우 위로 올라감.
        onTap: (int index){
          // print(index); // 작동하는지 테스트.
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedFontSize: 12,
        selectedItemColor: Colors.black, // 선택한 아이콘 글자 표시 및 색상 설정
        selectedLabelStyle: TextStyle(color: Colors.black),// 선택한 아이콘 글자 표시 및 색상 설정
        items: [
          _bottomNavigationBarItem("home", "홈"),
          _bottomNavigationBarItem("user", "설정"),
        ],
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }
}
