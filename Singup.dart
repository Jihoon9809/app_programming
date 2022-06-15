
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/screens/bottombar.dart';
import 'package:news/screens/login.dart';
import 'package:news/screens/myuser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news/screens/profile.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SingupPage extends StatefulWidget {
  const SingupPage({Key? key}) : super(key: key);

  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwrodController = TextEditingController();
  late bool _sucess;
  late String _userEmail;

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
        postDetailsToFirestore()
      }).catchError((e) {

      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    Myuser myuser = Myuser();

    myuser.email = user!.email;
    myuser.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(myuser.toMap());

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => bottom()));
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

    final SignUp_screen = Container(
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Container(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("News",
                        style: TextStyle(fontSize:70,
                            fontWeight: FontWeight.bold)),
                    Text("Sign into your account",
                        style: TextStyle(fontSize:20,
                            color: Colors.grey[500])),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 350,
                child:
                TextFormField(
                  controller: _emailController,
                  onSaved: (value){
                    _emailController.text = value!;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person_outline),
                    hintText: 'ID',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 350,
                child:
                TextFormField(
                    controller: _passwrodController,
                    onSaved: (value){
                      _passwrodController.text = value!;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'password',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    )
                ),),
              SizedBox(height: 30),
              ButtonBar(
                alignment : MainAxisAlignment.spaceAround,
                buttonPadding: EdgeInsets.all(10),
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Do you have Id?')),
                  ElevatedButton(
                      onPressed: () async{
                        signUp(_emailController.text,_passwrodController.text);
                      },
                      child: Text('submit')),
                ],
              ),
            ],
          )
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: home_logo,
        centerTitle: true,
        leading: Leading_button,
        actions: <Widget>[ Info_button,
      ],),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return ProfileScreen();
          }else{
            return SignUp_screen;
          }
        },
      )
    );
  }
}

