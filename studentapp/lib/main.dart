import 'package:flutter/material.dart';
import 'package:studentapp/screens/welcome_page.dart';
import 'custom_appbar_sample.dart';
import 'default_appbar_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //final String title;
  static String page;
  
  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: StaticStudent.studentId == null?"/welcome":"/",
      routes: {
        "/welcome":(BuildContext context)=>WelcomePage(),
        "/": (BuildContext context) => DefaultAppBarDemo(),
        "/custom": (BuildContext context) => CustomAppBarDemo(),
      },
      
    );
  }
}
