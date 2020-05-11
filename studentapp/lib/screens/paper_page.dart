import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:kf_drawer/kf_drawer.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:studentapp/screens/qustionSelcet.dart';
import 'package:studentapp/service/database.dart';

import '../main.dart';

class PaperPage extends  MyApp{
  static double qNumber;
    static dynamic questions;
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
    _controller.addListener(() {
    setState(() {
      PaperPage.qNumber = _controller.page;
    });
  });
    List<Widget> items = [
      buildPage(1,PaperPage.questions[0], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(2,PaperPage.questions[1], Colors.green),
      buildPage(3,PaperPage.questions[2], Colors.amber),
      buildPage(4,PaperPage.questions[3], Colors.deepPurple),
      buildPage(5,PaperPage.questions[4], Colors.teal),
      buildPage(6,PaperPage.questions[5], Colors.pink),
      buildPage(7,PaperPage.questions[6], Colors.brown),
      buildPage(8,PaperPage.questions[7], Colors.red),
      buildPage(9,PaperPage.questions[8], Colors.blue),
      buildPage(10,PaperPage.questions[9], Colors.green),
      buildPage(11,PaperPage.questions[10], Colors.amber),
      buildPage(12,PaperPage.questions[11], Colors.deepPurple),
      buildPage(13,PaperPage.questions[12], Colors.teal),
      buildPage(14,PaperPage.questions[13], Colors.pink),
      buildPage(15,PaperPage.questions[14], Colors.brown),
      buildPage(16,PaperPage.questions[15], Colors.red),
      buildPage(17,PaperPage.questions[16], Colors.blue),
      buildPage(18,PaperPage.questions[17], Colors.green),
      buildPage(19,PaperPage.questions[18], Colors.amber),
      buildPage(20,PaperPage.questions[19], Colors.deepPurple),
    ];

    

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
                              duration: Duration(minutes: 25),
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
                                  color: Colors.blue[800],
                                  child: Text(
                                    'Back'
                                  ),
                                  onPressed: () { 
                                    PaperPage.qNumber = _controller.page - 1;
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
                                      PaperPage.qNumber = _controller.page;
                                      print(PaperPage.qNumber);
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
                                    PaperPage.qNumber = null;
                                    print('finsh');
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
                              duration: Duration(minutes: 25),
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
                                SizedBox(width: 50,),
                                RaisedButton(
                                  child: Text(
                                    'All'
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
                                  child: Text(
                                    'Next'
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
                              duration: Duration(minutes: 25),
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
                                  color: Colors.blue[800],
                                  child: Text(
                                    'Back'
                                  ),
                                  onPressed: () { 
                                    PaperPage.qNumber = _controller.page - 1;
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
                                      PaperPage.qNumber = _controller.page;
                                      print(PaperPage.qNumber);
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
      return Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          color: color,
          child: DraggableScrollableSheet(
            expand: true,
            initialChildSize: 1,
            minChildSize: 1,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: color,
                child: Column(
                  children: <Widget>[ 
                    Row(

                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                          child: Text(
                            qContent['question'],
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
                
              );
            },
          ),
          //Center(child: Text(text, style: TextStyle(fontSize: 42, color: Colors.white),),),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          color: color,
          child: DraggableScrollableSheet(
            expand: true,
            initialChildSize: 1,
            minChildSize: 1,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: color,
                child: Column(
                  children: <Widget>[ 
                    Row(

                      children: <Widget>[
                        Text(
                          qContent['question'],
                          
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
                
              );
            },
          ),
          //Center(child: Text(text, style: TextStyle(fontSize: 42, color: Colors.white),),),
        ),
      );
    }
  }
}
