import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/service/database.dart';
// import 'package:kf_drawer/kf_drawer.dart';

import '../main.dart';
import 'paper_page.dart';

class PaperAccessPage extends MyApp {

  @override
  _PaperAccessPageState createState() => _PaperAccessPageState();
}

class _PaperAccessPageState extends State<PaperAccessPage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     ClipRRect(
            //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //       child: Material(
            //         shadowColor: Colors.transparent,
            //         color: Colors.transparent,
            //         child: IconButton(
            //           icon: Icon(
            //             Icons.menu,
            //             color: Colors.black,
            //           ),
            //           // onPressed: widget.onMenuPressed,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            RaisedButton(
              onPressed: () {
                PaperPage.qNumber = 0;
                Navigator.of(context).push(CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      MyApp.page = 'PaperPage';
                      PaperPage.answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                      return new StreamBuilder(
                          stream: Firestore.instance.collection('papers').document('11').collection('paperNumbers').document('202001').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            }
                            print(snapshot.data['questions']);
                            PaperPage.questions = snapshot.data['questions'];
                            return PaperPage();
                          }
                      );
                    },
                  ),
                );
              },
              padding: EdgeInsets.all(30),
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_alarm),
                  Text('hi')
                ],
              )

            ),
          ],
        ),
      ),
    );
  

    // var endTime = DateTime(2020,4,16,5,28,0);
    // print(endTime.difference(DateTime.now()));
    // if(endTime.difference(DateTime.now()).inSeconds<0){
    //   return SafeArea(
    //   child: Center(
    //     child: Column(
    //       children: <Widget>[
    //         Row(
    //           children: <Widget>[
    //             ClipRRect(
    //               borderRadius: BorderRadius.all(Radius.circular(32.0)),
    //               child: Material(
    //                 shadowColor: Colors.transparent,
    //                 color: Colors.transparent,
    //                 child: IconButton(
    //                   icon: Icon(
    //                     Icons.menu,
    //                     color: Colors.black,
    //                   ),
    //                   onPressed: widget.onMenuPressed,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Expanded(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //                Text('paper is over')
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    // } else {
    //   return SafeArea(
    //   child: Center(
    //     child: Column(
    //       children: <Widget>[
    //         Row(
    //           children: <Widget>[
    //             ClipRRect(
    //               borderRadius: BorderRadius.all(Radius.circular(32.0)),
    //               child: Material(
    //                 shadowColor: Colors.transparent,
    //                 color: Colors.transparent,
    //                 child: IconButton(
    //                   icon: Icon(
    //                     Icons.menu,
    //                     color: Colors.black,
    //                   ),
    //                   onPressed: widget.onMenuPressed,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Expanded(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //                FlipClock.countdown(
    //                     duration: endTime.difference(DateTime.now()),
    //                     digitColor: Colors.white,
    //                     backgroundColor: Colors.black,
    //                     digitSize: 48.0,
    //                     borderRadius: const BorderRadius.all(Radius.circular(3.0)),
    //                     onDone: () => print('ih'),
    //                   ),
                      
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    // }
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
