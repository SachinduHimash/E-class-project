import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import 'answer_page.dart';

class AnswerQustionSelect extends MyApp {
  @override
  _AnswerQustionSelectState createState() => _AnswerQustionSelectState();
}

class _AnswerQustionSelectState extends State<AnswerQustionSelect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 0;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('1'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[0] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 1;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('2'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[1] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 2;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('3'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[2] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 3;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('4'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[3] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 4;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('5'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[4] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 5;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('6'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[5] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 6;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('7'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[6] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 7;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('8'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[7] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 8;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('9'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[8] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 9;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('10'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[9] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 10;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('11'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[10] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 11;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('12'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[11] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 12;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('13'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[12] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 13;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('14'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[13] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 14;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('15'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[14] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 15;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('16'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[15] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 16;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('17'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[16] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 17;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('18'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[17] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () { 
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 18;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('19'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[18] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              AnswerPage.qNumber = 19;
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );
                      },
                      child: Text('20'),
                      padding: EdgeInsets.all(25),
                      color: AnswerPage.answer[19] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              MyApp.page = 'AnswerPage';
                              return AnswerPage();
                            },
                          ),
                        );      
                      },
                      child: Text('back'),
                      padding: EdgeInsets.all(25),
                      color:Colors.blue[400],
                    ),
                  ],
                ),
              ],
            )
          ),
        )
      );
  }
}