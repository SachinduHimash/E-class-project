import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Home extends MyApp {

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed:() => { print('ff')},
                padding: EdgeInsets.all(30),
                child: Row(
                  children: <Widget>[
                    Text('Home',
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
                    
                  ],
                )

              ),
            ],
          ),
        ),
      ),
    );
  
  }

  Widget buildPage(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        color: color,
        child: Center(child: Text(text, style: TextStyle(fontSize: 42, color: Colors.white),),),
      ),
    );
  }
}
