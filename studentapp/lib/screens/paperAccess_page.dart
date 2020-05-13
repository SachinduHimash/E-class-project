import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'paper_page.dart';
import 'paper_page40.dart';

class PaperAccessPage extends MyApp {

  @override
  _PaperAccessPageState createState() => _PaperAccessPageState();

}

class _PaperAccessPageState extends State<PaperAccessPage> {
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () async{
                  await Firestore.instance.collection('paperAccess').document('9.1').collection('day').document('20200414')
                  .get().then((x) async=> {
                      if(x.data["access"]){
                      await Firestore.instance.collection('paperAccess').document('9.1').collection('day').document('20200414').collection('student').document('202020001')
                      .get().then((y) => {
                        
                        if(y.data["access"]){
                          
                          Navigator.of(context).push(CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                if(x.data["questions"] == 40) {
                                  PaperPage40.qNumber = 0;
                                  MyApp.page = 'PaperPage40';
                                  PaperPage40.answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                                  return new StreamBuilder(
                                    stream: Firestore.instance.collection('papers').document('11').collection('paperNumbers').document('202001').snapshots(),
                                    builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                        return new Text("Loading");
                                      }
                                                
                                    PaperPage40.questions = snapshot.data['questions'];
                                    return PaperPage40();
                                    }
                                  );
                                } else {
                                  PaperPage.qNumber = 0;
                                  MyApp.page = 'PaperPage';
                                  PaperPage.answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                                  PaperPage.endTime = DateTime.parse(x.data["endTime"].toDate().toString());
                                  print(PaperPage.endTime);
                                  print(DateTime.now());
                                  print( PaperPage.endTime.difference(DateTime.now()));
                                  return new StreamBuilder(
                                    stream: Firestore.instance.collection('papers').document('11').collection('paperNumbers').document('202001').snapshots(),
                                    builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                        return new Text("Loading");
                                      }
                                                
                                    PaperPage.questions = snapshot.data['questions'];
                                    return PaperPage();
                                    }
                                  );
                                }
                                          
                              },
                            ),
                          ),
                       
                        } else{
                          showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('your not in a class'),
                              content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('pleass mark your attendance'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        )
                        
                        }                 

                      }).catchError((e)=>{
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('your not in a class'),
                              content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('pleass mark your attendance'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        )
                      }),
                         
                    } else {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Paper not distributed'),
                              content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('wait for sir ccommand'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        )
                                    
                    }
                    });
                     
                
                },
                padding: EdgeInsets.all(30),
                child: Row(
                  children: <Widget>[
                    Text('2020.05.12    Waruna    11',
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
                    
                  ],
                )

              ),
            ],
          ),
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
