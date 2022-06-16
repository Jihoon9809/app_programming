import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/myuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  Myuser loggedInUser = Myuser();


  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = Myuser.fromMap(value.data());
      setState(() {

      });
    });
  }
  Widget user_image(){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 100,
            height: 100,
              child: Image.asset('assets/images/user.png',fit: BoxFit.cover,),
       ),
      )
    ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            Container(
              child: user_image(),),
            SizedBox(height: 30),
            Container(
              child: Text(
                '이메일: ${loggedInUser.email}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50),
                    ElevatedButton.icon(onPressed: ()=> FirebaseAuth.instance.signOut(),
                    icon: Icon(Icons.arrow_back,size:32),
                    label: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 24),
                    )),
          ],
        ),
      ),
    );
  }
}
