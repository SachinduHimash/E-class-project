import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'screens/auth_page.dart';
import 'screens/calendar_page.dart';
import 'screens/paperAccess_page.dart';
import 'screens/main_page.dart';
import 'utils/class_builder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;
  static String page;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;
  
  @override
  void initState() {
    if(MainWidget.page != null){
      super.initState();
      _drawerController = KFDrawerController(
        initialPage: ClassBuilder.fromString(MainWidget.page),
        items: [
          KFDrawerItem.initWithPage(
            text: Text('DASHBOARD', style: TextStyle(color: Colors.black)),
            icon: Icon(Icons.home, color: Colors.black),
            page: MainPage(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              'PAPER',
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.chrome_reader_mode, color: Colors.black),
            page: PaperAccessPage(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              'CALENDAR',
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.calendar_today, color: Colors.black),
            page: CalendarPage(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              'SETTINGS',
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.settings, color: Colors.black),
            page: ClassBuilder.fromString('SettingsPage'),
          ),
        ],
      );
    } else {
      super.initState();
      _drawerController = KFDrawerController(
        initialPage: ClassBuilder.fromString('MainPage'),
        items: [
          KFDrawerItem.initWithPage(
            text: Text('MAIN', style: TextStyle(color: Colors.black)),
            icon: Icon(Icons.home, color: Colors.black),
            page: MainPage(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              'PAPER',
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.chrome_reader_mode, color: Colors.black),
            page: PaperAccessPage(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              'CALENDAR',
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.calendar_today, color: Colors.black),
            page: CalendarPage(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              'SETTINGS',
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.settings, color: Colors.black),
            page: ClassBuilder.fromString('SettingsPage'),
          ),
        ],
      );
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: 
            // Text('hi'
            // ),
            Image.asset(
              'assets/logo1.png',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN OUT',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return AuthPage();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(255, 255, 255, 1.0), Color.fromRGBO(44, 72, 171, 1.0)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
