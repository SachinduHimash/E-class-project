import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:studentapp/screens/paper_page.dart';

import '../main.dart';

class QustionSelect extends KFDrawerContent {
  @override
  _QustionSelectState createState() => _QustionSelectState();
}

class _QustionSelectState extends State<QustionSelect> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('1'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 1;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('2'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 2;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('3'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
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
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('4'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 4;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('5'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 5;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('6'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
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
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('7'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 7;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('8'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 8;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('9'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
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
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('10'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 10;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('11'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 11;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('12'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
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
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('13'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 13;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('14'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 14;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('15'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
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
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('16'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 16;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('17'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 17;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('18'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
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
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('19'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        PaperPage.qNumber = 19;
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                  );
                },
                child: Text('20'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        MainWidget.page = 'PaperPage';
                        return MainWidget();
                      },
                    ),
                   );      
                },
                child: Text('back'),
                padding: EdgeInsets.all(25),
                color: Colors.orange[900],
              ),
            ],
          ),
        ],
      )
    );
  }
}