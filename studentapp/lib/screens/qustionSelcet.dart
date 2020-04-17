import 'package:flutter/material.dart';

class QustionSelect extends StatefulWidget {
  QustionSelect({Key key}) : super(key: key);

  @override
  _QustionSelectState createState() => _QustionSelectState();
}

class _QustionSelectState extends State<QustionSelect> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Container(
            child: Text('1'),
            padding: EdgeInsets.all(30),
            color: Colors.orange[900],
          ),
          Container(
            child: Text('3'),
            padding: EdgeInsets.all(30),
            color: Colors.amber,
          ),
          Container(
            child: Text('3'),
            padding: EdgeInsets.all(30),
            color: Colors.orange[900],
          ),
        ],
      ),
    );
  }
}