import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/screens/login_screen.dart';
import 'package:flutter_instagram_clone/screens/signup_screen.dart';
import 'package:flutter_instagram_clone/screens/feed_screen.dart';
import 'package:flutter_instagram_clone/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget _getScreenId(){
   return StreamBuilder<FirebaseUser>(
       stream: FirebaseAuth.instance.onAuthStateChanged,
       builder: (BuildContext context, snapshot){
         if(snapshot.hasData)
           return HomeScreen();
         else
           return LoginScreen();
       });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: _getScreenId(),
      routes:{
        LoginScreen.id:(context)=>LoginScreen(),
        SignupScreen.id:(context)=>SignupScreen(),
        FeedScreen.id:(context)=>FeedScreen()
      },
    );
  }
}
