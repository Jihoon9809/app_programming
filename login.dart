import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/profile.dart';
import 'package:news/screens/singup.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  int _sucess = 1;
  String _userEmail = "";

  void _singIn() async{
    final User? user = (await _auth.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text)).user;

    if(user != null){
      setState(() {
        _sucess = 2;
        _userEmail = user.email!;
        print("성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!성공1!");
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen()));
      });
    } else{
      setState(() {
        _sucess = 3;
      });
    }
  }
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
                    controller: _emailcontroller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person_outline),
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
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock_outline),
                        hintText: 'password',
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      )
                  ),),
                Container(
                  alignment: Alignment.center,
                  child: Text(_sucess == 1 ? " ": (_sucess == 2 ? '로그인 성공':'로그인 실패'),
                )),
                SizedBox(height: 30),
                ButtonBar(
                  alignment : MainAxisAlignment.spaceAround,
                  buttonPadding: EdgeInsets.all(10),
                  children: [
                    TextButton(
                        onPressed: (){                        },
                        child: Text('forget password?')),
                    ElevatedButton(
                        onPressed: ()async{
                          _singIn();
                        },
                        child: Text('Login')),
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
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SingupPage()),);
                    },
                    child: Text('Go Sing up')),
              ],),
      ],),
    ),),);
  }
}
