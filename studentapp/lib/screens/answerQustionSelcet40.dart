import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:kf_drawer/kf_drawer.dart';
import 'package:studentapp/screens/paper_page40.dart';

import '../main.dart';
import 'answer_page40.dart';

class AnswerQustionSelect40 extends MyApp {
  @override
  _AnswerQustionSelect40State createState() => _AnswerQustionSelect40State();
}

class _AnswerQustionSelect40State extends State<AnswerQustionSelect40> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
        builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                child:Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[ 
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 0;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('1'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[0] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 1;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('2'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[1] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 2;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('3'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[2] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 3;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('4'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[3] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 4;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('5'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[4] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 5;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('6'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[5] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 6;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('7'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[6] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 7;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('8'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[7] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 8;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('9'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[8] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 9;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('10'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[9] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 10;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('11'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[10] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 11;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('12'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[11] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 12;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('13'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[12] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 13;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('14'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[13] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 14;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('15'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[14] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 15;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('16'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[15] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 16;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('17'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[16] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 17;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('18'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[17] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () { 
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 18;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('19'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[18] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 19;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('20'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[19] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 20;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('21'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[19] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 21;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('22'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[21] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 22;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('23'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[22] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 23;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('24'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[23] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 24;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('25'),
                                padding: EdgeInsets.all(24),
                                color: AnswerPage40.answer[3] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 25;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('26'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[25] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 26;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('27'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[26] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 27;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('28'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[27] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 28;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('29'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[28] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 29;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('30'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[29] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 30;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('31'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[30] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 31;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('32'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[31] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 32;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('33'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[32] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 33;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('34'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[33] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 34;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('35'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[34] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 35;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('36'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[35] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 36;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('37'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[36] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 37;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('38'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[37] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 38;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('39'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[38] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () { 
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage40.qNumber = 39;
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );
                                },
                                child: Text('40'),
                                padding: EdgeInsets.all(25),
                                color: AnswerPage40.answer[39] == 0 ? Colors.orange[900] : Colors.green[700],
                              ),
                              
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        MyApp.page = 'AnswerPage40';
                                        return AnswerPage40();
                                      },
                                    ),
                                  );      
                                },
                                child: Text('back'),
                                padding: EdgeInsets.all(25),
                                color:Colors.orange[900],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //Center(child: Text(text, style: TextStyle(fontSize: 42, color: Colors.white),),),
                  ),
                ),
              ),
            ),
          );
        },
      )
            
            )
          ),
        );
  }
}