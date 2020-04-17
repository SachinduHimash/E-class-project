import 'package:flutter/material.dart';

class Paper extends StatefulWidget {
  Paper({Key key}) : super(key: key);

  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('hi'),
    );
  }
}