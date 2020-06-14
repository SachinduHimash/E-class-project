import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:kf_drawer/kf_drawer.dart';
import 'package:studentapp/screens/paper_page.dart';

import '../main.dart';

class QustionSelect extends MyApp {
  @override
  _QustionSelectState createState() => _QustionSelectState();
}

class _QustionSelectState extends State<QustionSelect> {
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
                              PaperPage.qNumber = 0;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('1'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[0] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 1;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('2'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[1] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 2;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('3'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[2] == 0 ? Colors.blue[400] : Colors.green[700],
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
                              PaperPage.qNumber = 3;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('4'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[3] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 4;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('5'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[4] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 5;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('6'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[5] == 0 ? Colors.blue[400] : Colors.green[700],
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
                              PaperPage.qNumber = 6;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('7'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[6] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 7;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('8'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[7] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 8;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('9'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[8] == 0 ? Colors.blue[400] : Colors.green[700],
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
                              PaperPage.qNumber = 9;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('10'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[9] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 10;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('11'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[10] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 11;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('12'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[11] == 0 ? Colors.blue[400] : Colors.green[700],
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
                              PaperPage.qNumber = 12;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('13'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[12] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 13;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('14'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[13] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 14;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('15'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[14] == 0 ? Colors.blue[400] : Colors.green[700],
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
                              PaperPage.qNumber = 15;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('16'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[15] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 16;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('17'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[16] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 17;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('18'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[17] == 0 ? Colors.blue[400] : Colors.green[700],
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
                              PaperPage.qNumber = 18;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('19'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[18] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              PaperPage.qNumber = 19;
                              MyApp.page = 'PaperPage';
                              return PaperPage();
                            },
                          ),
                        );
                      },
                      child: Text('20'),
                      padding: EdgeInsets.all(25),
                      color: PaperPage.answer[19] == 0 ? Colors.blue[400] : Colors.green[700],
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              MyApp.page = 'PaperPage';
                              return PaperPage();
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