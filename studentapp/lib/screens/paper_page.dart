import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:studentapp/screens/qustionSelcet.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:studentapp/screens/welcome_page.dart';

import '../main.dart';

class PaperPage extends  MyApp{
  static double qNumber;
    static dynamic questions;
    static dynamic endTime;
    static dynamic paperNumber;
    static bool timeout;
    static List<int> answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    
    @override
    _PaperPageState createState() => _PaperPageState();
  }

class _PaperPageState extends State<PaperPage> {
   
  PageController _controller;
  

  @override
  void initState() {
    
    if(PaperPage.qNumber != null){

       _controller = PageController(initialPage: PaperPage.qNumber.round());
    
    } else {
      _controller = PageController();
    }
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'login/marks',
    );
    _controller.addListener(() {
    
    setState(() {
      PaperPage.qNumber = _controller.page;
    });
  });
    List<Widget> items = [
      buildPage(1,PaperPage.questions[0], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(2,PaperPage.questions[1], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(3,PaperPage.questions[2], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(4,PaperPage.questions[3], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(5,PaperPage.questions[4], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(6,PaperPage.questions[5], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(7,PaperPage.questions[6], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(8,PaperPage.questions[7], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(9,PaperPage.questions[8], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(10,PaperPage.questions[9], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(11,PaperPage.questions[10], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(12,PaperPage.questions[11], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(13,PaperPage.questions[12], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(14,PaperPage.questions[13], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(15,PaperPage.questions[14], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(16,PaperPage.questions[15], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(17,PaperPage.questions[16], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(18,PaperPage.questions[17], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(19,PaperPage.questions[18], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(20,PaperPage.questions[19], Color.fromRGBO(10, 10, 10,0.1)),
    ];
    
    if(PaperPage.endTime.difference(DateTime.now()).toString()[0]=='-'){
      return SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: WillPopScope(
              onWillPop: () {  },
                          child: AlertDialog(
                                title: Text('Time out'),
                                content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('paper is over'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      timeout();
                                      Navigator.of(context).push(CupertinoPageRoute(
                                        fullscreenDialog: true,
                                        builder: (BuildContext context) {
                                          MyApp.page = 'myapp';
                                          return MyApp();
                                          },
                                        ),
                                      );
                                      
                                    },
                                  ),
                                ],
                              ),
            ),
          )
        )
      );
    } else {
      if( PaperPage.qNumber == 19){
        return new WillPopScope(
          onWillPop: () async => false,
          child: MaterialApp(
          home: Scaffold(
            body: SafeArea(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              heightFactor: 1.4,
                              child: FlipClock.countdown(
                                duration:  PaperPage.endTime.difference(DateTime.now()),
                                digitColor: Colors.white,
                                backgroundColor: Colors.black,
                                digitSize: 48.0,
                                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                                onDone: () =>timeout(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: PageView(
                                children: items,
                                controller: _controller,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 3 , 0, 5),
                              child: ScrollingPageIndicator(
                                dotColor: Colors.grey,
                                dotSelectedColor: Colors.deepPurple,
                                dotSize: 6,
                                dotSelectedSize: 8,
                                dotSpacing: 12,
                                controller: _controller,
                                itemCount: items.length,
                                orientation: Axis.horizontal
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'Back',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () { 
                                      PaperPage.qNumber = _controller.page - 1;
                                      
                                      setState(() {
                                        _controller.previousPage(duration: Duration(microseconds: 150), curve: Curves.ease);
                                      });
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'All',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () { 
                                      Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        PaperPage.qNumber = _controller.page;
                                        print(PaperPage.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect();
                                      },
                                    ));
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'submit',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async { 
                                      var marks =0;
                                      if(PaperPage.answer.indexOf(0) == -1){
                                        PaperPage.qNumber = null;
                                        for (var i = 0; i < PaperPage.answer.length; i++) {
                                          if(PaperPage.answer[i] == PaperPage.questions[i]['correctAnswer']){
                                            marks+=5;
                                          }
                                        }
                                        dynamic resp = await callable.call(<String, dynamic>{
                                          'userID': StaticStudent.studentId,
                                          'class': StaticStudent.studentClass,
                                          'grade': StaticStudent.studentClass.split('.')[0],
                                          'paperNumber': PaperPage.paperNumber,
                                          'photo': '',
                                          'school': StaticStudent.studentSchool,
                                          'marks':marks,
                                          'answer' : PaperPage.answer,
                                          'name': StaticStudent.studentFullname,

                                        });
                                        
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return 
                                            WillPopScope(
                                              onWillPop: () {  },
                                              child: 
                                              new AlertDialog(
                                                title: Text('Marks'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Text('Your marks is $marks'),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text('Ok'),
                                                    onPressed: () {
                                                      Navigator.of(context).push(CupertinoPageRoute(
                                                            fullscreenDialog: true,
                                                            builder: (BuildContext context) {
                                                              MyApp.page = 'myapp';
                                                              PaperPage.qNumber = 0;
                                                              return MyApp();
                                                            },
                                                        ),
                                                      );
                                          
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        );
                                        
                                      } else {
                                        return showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Paper not Completed'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text('You must complete every question'),
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
                                    },
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ));
      } else if(PaperPage.qNumber == 0 ) {
        return new WillPopScope(
          onWillPop: () async => false,
          child:MaterialApp(
          home: Scaffold(
            body: SafeArea(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              heightFactor: 1.4,
                              child: FlipClock.countdown(
                                duration:  PaperPage.endTime.difference(DateTime.now()),
                                digitColor: Colors.white,
                                backgroundColor: Colors.black,
                                digitSize: 48.0,
                                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                                onDone: () => timeout(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: PageView(
                                children: items,
                                controller: _controller,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 3 , 0, 5),
                              child: ScrollingPageIndicator(
                                dotColor: Colors.grey,
                                dotSelectedColor: Colors.deepPurple,
                                dotSize: 6,
                                dotSelectedSize: 8,
                                dotSpacing: 12,
                                controller: _controller,
                                itemCount: items.length,
                                orientation: Axis.horizontal
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(width: 90,),
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'All',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () { 
                                      Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        PaperPage.qNumber = _controller.page;
                                        print(PaperPage.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect();
                                      },
                                    ));
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'Next',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      PaperPage.qNumber = _controller.page + 1;
                                      
    setState(() {
                                        _controller.nextPage(duration: Duration(microseconds: 1), curve: Curves.ease);
                                      });
                                    },
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ));
      } else {
        return new WillPopScope(
          onWillPop: () async => false,
          child:MaterialApp(
          home: Scaffold(
            body: SafeArea(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              heightFactor: 1.4,
                              child: FlipClock.countdown(
                                duration: PaperPage.endTime.difference(DateTime.now()),
                                digitColor: Colors.white,
                                backgroundColor: Colors.black,
                                digitSize: 48.0,
                                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                                onDone: () => timeout(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: PageView(
                                children: items,
                                controller: _controller,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 3 , 0, 5),
                              child: ScrollingPageIndicator(
                                dotColor: Colors.grey,
                                dotSelectedColor: Colors.deepPurple,
                                dotSize: 6,
                                dotSelectedSize: 8,
                                dotSpacing: 12,
                                controller: _controller,
                                itemCount: items.length,
                                orientation: Axis.horizontal
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'Back',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () { 
                                      PaperPage.qNumber = _controller.page - 1;
                                      
    setState(() {
                                        _controller.previousPage(duration: Duration(microseconds: 150), curve: Curves.ease);
                                      });
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'All',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () { 
                                      Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        PaperPage.qNumber = _controller.page;
                                        print(PaperPage.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect();
                                      },
                                    ));
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.blueGrey[900],
                                    child: Text(
                                      'Next',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () { 
                                      PaperPage.qNumber = _controller.page + 1;
                                      
    setState(() {
                                        _controller.nextPage(duration: Duration(microseconds: 1), curve: Curves.ease);
                                      });
                                    },
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ));
      }
    }

    


    
  

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
    //                Text('PaperPage is over')
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

  Widget buildPage(int qNumber,dynamic qContent, Color color) {
    if(qContent['picture'] == ''){
      return LayoutBuilder(
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
                    color: color,
                    child: Column(
                      children: <Widget>[ 
                        Row(

                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                              width: MediaQuery.of(context).size.width*0.9,
                              child: Text(
                                qNumber.toString()+' ' +'  '+qContent['question'],
                                textAlign: TextAlign.start,           
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: RaisedButton(
                                  color: PaperPage.answer[qNumber-1] == 1 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage.answer[qNumber-1] = 1;
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                  child: Text(
                                    '1   '+qContent['answer1'],
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child:RaisedButton(
                                  color: PaperPage.answer[qNumber-1] == 2 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage.answer[qNumber-1] = 2;
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                    child: Text(
                                      '2   '+qContent['answer2'],
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child:RaisedButton(
                              color: PaperPage.answer[qNumber-1] == 3 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage.answer[qNumber-1] = 3;
                                });
                              },
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              child: Text(
                                '3   '+qContent['answer3'],
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: RaisedButton(
                              color: PaperPage.answer[qNumber-1] == 4 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage.answer[qNumber-1] = 4;
                                });
                              },
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              child: Text(
                                '4   ' +qContent['answer4'],
                                textAlign: TextAlign.start,
                              ),
                            ),),),
                          ],
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
      );
    } else {
      return LayoutBuilder(
        builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    color: color,
                    child: Column(
                      children: <Widget>[ 
                        Row(

                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 30, 20, 5),
                              width: MediaQuery.of(context).size.width*0.9,
                              child: Text(
                                 qNumber.toString()+' ' +'  '+qContent['question'],
                                
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: NetworkImage(qContent['picture']),
                                height: 250,
                                width: 270,
                                ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: RaisedButton(
                                  color: PaperPage.answer[qNumber-1] == 1 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage.answer[qNumber-1] = 1;
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                  child: Text(
                                    '1   '+qContent['answer1'],
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child:RaisedButton(
                                  color: PaperPage.answer[qNumber-1] == 2 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage.answer[qNumber-1] = 2;
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                    child: Text(
                                      '2   '+qContent['answer2'],
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child:RaisedButton(
                              color: PaperPage.answer[qNumber-1] == 3 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage.answer[qNumber-1] = 3;
                                });
                              },
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              child: Text(
                                '3   '+qContent['answer3'],
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: RaisedButton(
                              color: PaperPage.answer[qNumber-1] == 4 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage.answer[qNumber-1] = 4;
                                });
                              },
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              child: Text(
                                '4   ' +qContent['answer4'],
                                textAlign: TextAlign.start,
                              ),
                            ),),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Center(child: Text(text, style: TextStyle(fontSize: 42, color: Colors.white),),),
                )
              )
            )
          );
        }    
      );
      
      
      
    }
  }

  void timeout(){
    if(!PaperPage.timeout){
      PaperPage.timeout =true;
      var marks = 0;
      final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
        functionName: 'login/marks',
      );
      PaperPage.qNumber = null;
      for (var i = 0; i < PaperPage.answer.length; i++) {
        if(PaperPage.answer[i] == PaperPage.questions[i]['correctAnswer']){
          marks+=5;
        }
      }
      callable.call(<String, dynamic>{
        'userID': StaticStudent.studentId,
        'class': StaticStudent.studentClass,
        'grade': StaticStudent.studentClass.split('.')[0],
        'paperNumber': PaperPage.paperNumber,
        'photo': '',
        'school': StaticStudent.studentSchool,
        'marks':marks,
        'answer' : PaperPage.answer,
        'name': StaticStudent.studentFullname,

      });
    }
  }
}
