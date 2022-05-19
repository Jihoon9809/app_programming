import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final home_logo = Text( //어플 로고이미지로 변경
      "News",
      style: TextStyle(
          color: Colors.black),
    );
    final Leading_button = IconButton( onPressed: () {print("검색버튼");},icon: Icon(Icons.search), color: Colors.grey,);

    final Info_button = IconButton(onPressed: (){print("문의사항 이동");}, icon: Icon(Icons.info),color: Colors.grey,);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: home_logo,
        centerTitle: true,
        leading: Leading_button,
        actions: <Widget>[ Info_button,
        ],),
      body: Container(
        child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Text('Sing in',
                    style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Container(
                  width: 350,
                  child:
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'ID',
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      )
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 350,
                  child:
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'password',
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      )
                  ),),
                SizedBox(height: 30),
                ButtonBar(
                  alignment : MainAxisAlignment.spaceAround,
                  buttonPadding: EdgeInsets.all(10),
                  children: [
                    TextButton(
                        onPressed: (){},
                        child: Text('forget password?')),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text('submit')),
                  ],
                ),
            Text('Sing up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ButtonBar(
                alignment : MainAxisAlignment.start,
                children: [
                TextButton(
                onPressed: (){},
            child: Text("             Don't have an account?")),
            ]),
            ButtonBar(
              alignment : MainAxisAlignment.spaceAround,
              buttonPadding: EdgeInsets.all(10),
              children: [
                TextButton(
                    onPressed: (){},
                    child: Text('')),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('Go Sing up')),
              ],),
      ],),
    ),),);
  }
}
