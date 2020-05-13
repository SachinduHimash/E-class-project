import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:studentapp/screens/qustionSelcet.dart';
import '../main.dart';

class AnswerPage extends  MyApp{
  static double qNumber;
    static dynamic questions;
    static dynamic endTime;
    static List<int> answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    
    @override
    _AnswerPageState createState() => _AnswerPageState();
  }

class _AnswerPageState extends State<AnswerPage> {
   
  PageController _controller;
  

  @override
  void initState() {
    
    if(AnswerPage.qNumber != null){

       _controller = PageController(initialPage: AnswerPage.qNumber.round());
    
    } else {
      _controller = PageController();
    }
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
    setState(() {
      AnswerPage.qNumber = _controller.page;
    });
  });
    List<Widget> items = [
      buildPage(1,AnswerPage.questions[0], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(2,AnswerPage.questions[1], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(3,AnswerPage.questions[2], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(4,AnswerPage.questions[3], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(5,AnswerPage.questions[4], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(6,AnswerPage.questions[5], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(7,AnswerPage.questions[6], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(8,AnswerPage.questions[7], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(9,AnswerPage.questions[8], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(10,AnswerPage.questions[9], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(11,AnswerPage.questions[10], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(12,AnswerPage.questions[11], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(13,AnswerPage.questions[12], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(14,AnswerPage.questions[13], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(15,AnswerPage.questions[14], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(16,AnswerPage.questions[15], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(17,AnswerPage.questions[16], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(18,AnswerPage.questions[17], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(19,AnswerPage.questions[18], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(20,AnswerPage.questions[19], Color.fromRGBO(10, 10, 10,0.1)),
    ];
    
    if(AnswerPage.endTime.difference(DateTime.now()).toString()[0]=='-'){
      return SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
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
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
          )
        )
      );
                      
                         
      
    } else {
      if( AnswerPage.qNumber == 19){
        return new WillPopScope(
          onWillPop: () async => false,
          child: MaterialApp(
          home: Scaffold(
            body: SafeArea(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      
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
                                    child: Text(
                                      'Back'
                                    ),
                                    onPressed: () { 
                                      AnswerPage.qNumber = _controller.page - 1;
                                      setState(() {
                                        _controller.previousPage(duration: Duration(microseconds: 150), curve: Curves.ease);
                                      });
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'All'
                                    ),
                                    onPressed: () { 
                                      Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage.qNumber = _controller.page;
                                        print(AnswerPage.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect();
                                      },
                                    ));
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'submit'
                                    ),
                                    onPressed: () { 
                                      var marks =0;
                                      if(AnswerPage.answer.indexOf(0) == -1){
                                        AnswerPage.qNumber = null;
                                        for (var i = 0; i < AnswerPage.answer.length; i++) {
                                          if(AnswerPage.answer[i] == AnswerPage.questions[i]['correctAnswer']){
                                            marks+=5;
                                          }
                                        }
                                        
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Marks'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text('you marks is $marks'),
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
                                                            AnswerPage.qNumber = 0;
                                                            return MyApp();
                                                          },
                                                      ),
                                                    );
                                        
                                                  },
                                                ),
                                              ],
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
                                                    Text('you must complete every question'),
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
      } else if(AnswerPage.qNumber == 0 ) {
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
                                duration:  AnswerPage.endTime.difference(DateTime.now()),
                                digitColor: Colors.white,
                                backgroundColor: Colors.black,
                                digitSize: 48.0,
                                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                                onDone: () => print('ih'),
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
                                    child: Text(
                                      'All'
                                    ),
                                    onPressed: () { 
                                      Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage.qNumber = _controller.page;
                                        print(AnswerPage.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect();
                                      },
                                    ));
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'Next'
                                    ),
                                    onPressed: () {
                                      AnswerPage.qNumber = _controller.page + 1;
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
                                duration: AnswerPage.endTime.difference(DateTime.now()),
                                digitColor: Colors.white,
                                backgroundColor: Colors.black,
                                digitSize: 48.0,
                                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                                onDone: () => print('ih'),
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
                                    child: Text(
                                      'Back'
                                    ),
                                    onPressed: () { 
                                      AnswerPage.qNumber = _controller.page - 1;
                                      setState(() {
                                        _controller.previousPage(duration: Duration(microseconds: 150), curve: Curves.ease);
                                      });
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'All'
                                    ),
                                    onPressed: () { 
                                      Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        AnswerPage.qNumber = _controller.page;
                                        print(AnswerPage.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect();
                                      },
                                    ));
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'Next'
                                    ),
                                    onPressed: () { 
                                      AnswerPage.qNumber = _controller.page + 1;
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
    //                Text('AnswerPage is over')
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
                                  color: AnswerPage.answer[qNumber-1] == 1 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    setState(() {
                                      AnswerPage.answer[qNumber-1] = 1;
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
                                  color: AnswerPage.answer[qNumber-1] == 2 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    setState(() {
                                      AnswerPage.answer[qNumber-1] = 2;
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
                              color: AnswerPage.answer[qNumber-1] == 3 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                setState(() {
                                  AnswerPage.answer[qNumber-1] = 3;
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
                              color: AnswerPage.answer[qNumber-1] == 4 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                setState(() {
                                  AnswerPage.answer[qNumber-1] = 4;
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
                                  color: AnswerPage.answer[qNumber-1] == 1 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    setState(() {
                                      AnswerPage.answer[qNumber-1] = 1;
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
                                  color: AnswerPage.answer[qNumber-1] == 2 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    setState(() {
                                      AnswerPage.answer[qNumber-1] = 2;
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
                              color: AnswerPage.answer[qNumber-1] == 3 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                setState(() {
                                  AnswerPage.answer[qNumber-1] = 3;
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
                              color: AnswerPage.answer[qNumber-1] == 4 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                setState(() {
                                  AnswerPage.answer[qNumber-1] = 4;
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
}
