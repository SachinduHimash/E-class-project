import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/default_appbar_demo.dart';
import 'package:studentapp/screens/welcome_page.dart';

import '../main.dart';
import 'paper_page.dart';
import 'paper_page40.dart';

class PaperAccessPage extends MyApp {
  static String today = new DateTime.now().year.toString()+(new DateTime.now().month.toString().length == 1 ? '0'+new DateTime.now().month.toString():new DateTime.now().month.toString())+new DateTime.now().day.toString();
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
              Image.asset("assets/logo1.png"),
              RaisedButton(
                onPressed: () async{
                  DefaultAppBarDemo.pr.show();
                  await Firestore.instance.collection('paperAccess').document(StaticStudent.studentClass.split('.')[0]).collection('day').document(PaperAccessPage.today)
                  .get().then((x) async=> {
                    print(x.data),
                    if(x.data["access"]){
                      await Firestore.instance.collection('class').document(StaticStudent.studentClass).collection('students').document(StaticStudent.studentId).collection('marks').document(x.data['paper'])
                      .get().then( (y) async {
                        if (y == null || !y.exists) {
                          // Document with id == docId doesn't exist.
                          await DefaultAppBarDemo.pr.hide();
                          Navigator.of(context).push(CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                if(x.data["questions"] == 40) {
                                  PaperPage40.qNumber = 0;
                                  MyApp.page = 'PaperPage40';
                                  PaperPage40.answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                                   PaperPage40.endTime = DateTime.now().add(new Duration(seconds:60*30));
                                  return new StreamBuilder(
                                    stream: Firestore.instance.collection('papers').document(StaticStudent.studentClass.split('.')[0]).collection('paperNumbers').document(x.data['paper']).snapshots(),
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
                                  PaperPage.endTime = DateTime.now().add(new Duration(seconds:60*30));
                                  return new StreamBuilder(
                                    stream: Firestore.instance.collection('papers').document(StaticStudent.studentClass.split('.')[0]).collection('paperNumbers').document(x.data['paper']).snapshots(),
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
                          );
                        } else {
                          await DefaultAppBarDemo.pr.hide();
                          showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('atemped'),
                              content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('only 1 attempt'),
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
                        );
                        }
                      }
                      
                       

                      // (y) 
                      
                      // async => {
                      //   print(y.data),
                      //   if(y.data.isEmpty){
                      //     await DefaultAppBarDemo.pr.hide(),
                      //     Navigator.of(context).push(CupertinoPageRoute(
                      //         fullscreenDialog: true,
                      //         builder: (BuildContext context) {
                      //           if(x.data["questions"] == 40) {
                      //             PaperPage40.qNumber = 0;
                      //             MyApp.page = 'PaperPage40';
                      //             PaperPage40.answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                      //              PaperPage40.endTime = DateTime.now().add(new Duration(seconds:60*30));
                      //             return new StreamBuilder(
                      //               stream: Firestore.instance.collection('papers').document('11').collection('paperNumbers').document('202001').snapshots(),
                      //               builder: (context, snapshot) {
                      //               if (!snapshot.hasData) {
                      //                   return new Text("Loading");
                      //                 }
                                                
                      //               PaperPage40.questions = snapshot.data['questions'];
                      //               return PaperPage40();
                      //               }
                      //             );
                      //           } else {
                      //             PaperPage.qNumber = 0;
                      //             MyApp.page = 'PaperPage';
                      //             PaperPage.answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                      //             PaperPage.endTime = DateTime.now().add(new Duration(seconds:60*30));
                      //             print(PaperPage.endTime);
                      //             print(DateTime.now());
                      //             print( PaperPage.endTime.difference(DateTime.now()));
                      //             return new StreamBuilder(
                      //               stream: Firestore.instance.collection('papers').document('11').collection('paperNumbers').document('202001').snapshots(),
                      //               builder: (context, snapshot) {
                      //               if (!snapshot.hasData) {
                      //                   return new Text("Loading");
                      //                 }
                                                
                      //               PaperPage.questions = snapshot.data['questions'];
                      //               return PaperPage();
                      //               }
                      //             );
                      //           }
                                          
                      //         },
                      //       ),
                      //     ),
                       
                      //   } else{
                      //     await DefaultAppBarDemo.pr.hide(),
                      //     showDialog<void>(
                      //     context: context,
                      //     barrierDismissible: false, // user must tap button!
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: Text('atemped'),
                      //         content: SingleChildScrollView(
                      //         child: ListBody(
                      //           children: <Widget>[
                      //             Text('only 1 attempt'),
                      //             ],
                      //           ),
                      //         ),
                      //         actions: <Widget>[
                      //           FlatButton(
                      //             child: Text('Ok'),
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   )
                        
                      //   }                 

                      // }
                      ).catchError((e) async =>{
                        print(e),
                        await DefaultAppBarDemo.pr.hide(),
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('You are not in the class'),
                              content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Please mark your attendance'),
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
                      })
                         
                    } else {
                        await DefaultAppBarDemo.pr.hide(),
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Paper not distributed'),
                              content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text("You don't have any papers today"),
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
                    }).catchError((e) async =>{
                      await DefaultAppBarDemo.pr.hide(),
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Paper not distributed'),
                              content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text("You don't have any papers today"),
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
                    
                    });
                     
                
                },
                padding: EdgeInsets.all(30),
                color: Colors.blue[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Do your paper',
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,color: Colors.white),)
                    
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
