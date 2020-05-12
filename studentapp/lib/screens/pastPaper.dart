import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'paper_page.dart';
import 'paper_page40.dart';

class PastPaper extends MyApp {

  @override
  _PastPaperState createState() => _PastPaperState();

}

class _PastPaperState extends State<PastPaper> {
  
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
                    Text('PastPaper',
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
