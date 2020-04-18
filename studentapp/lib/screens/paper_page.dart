import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

import '../main.dart';

class PaperPage extends KFDrawerContent {
  static double qNumber;
  static List<int> awnser= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
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
      buildPage(1, Colors.blue),
      buildPage(2, Colors.green),
      buildPage(3, Colors.amber),
      buildPage(4, Colors.deepPurple),
      buildPage(5, Colors.teal),
      buildPage(6, Colors.pink),
      buildPage(7, Colors.brown),
      buildPage(8, Colors.red),
      buildPage(9, Colors.blue),
      buildPage(10, Colors.green),
      buildPage(11, Colors.amber),
      buildPage(12, Colors.deepPurple),
      buildPage(13, Colors.teal),
      buildPage(14, Colors.pink),
      buildPage(15, Colors.brown),
      buildPage(16, Colors.red),
      buildPage(17, Colors.blue),
      buildPage(18, Colors.green),
      buildPage(19, Colors.amber),
      buildPage(20, Colors.deepPurple),
    ];

    if( PaperPage.qNumber == 19){
      return MaterialApp(
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
                                      MainWidget.page = 'QustionSelect';
                                      return MainWidget();
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
                                    print('finsh');},
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
      );
    } else if(PaperPage.qNumber == 0 ) {
      return MaterialApp(
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
                                      MainWidget.page = 'QustionSelect';
                                      return MainWidget();
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
      );
    } else {
      return MaterialApp(
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
                                      MainWidget.page = 'QustionSelect';
                                      return MainWidget();
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
      );
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

  Widget buildPage(int qNumber, Color color) {
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
                        '$qNumber',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: PaperPage.awnser[qNumber-1] == 1 ?  Colors.green[400] : Colors.amber,
                        onPressed: () {
                          setState(() {
                            PaperPage.awnser[qNumber-1] = 1;
                          });
                        },
                        child: Text(
                          '1  i am sexy boy 11',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      RaisedButton(
                        color: PaperPage.awnser[qNumber-1] == 2 ?  Colors.green[400] : Colors.amber,
                        onPressed: () {
                          setState(() {
                            PaperPage.awnser[qNumber-1] = 2;
                          });
                        },
                        child: Text(
                          '2   i am ',
                          textAlign: TextAlign.start,
                      ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: PaperPage.awnser[qNumber-1] == 3 ?  Colors.green[400] : Colors.amber,
                        onPressed: () {
                          setState(() {
                            PaperPage.awnser[qNumber-1] = 3;
                          });
                        },
                        child: Text(
                          '3  xxx',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      RaisedButton(
                        color: PaperPage.awnser[qNumber-1] == 4 ?  Colors.green[400] : Colors.amber,
                        onPressed: () {
                          setState(() {
                            PaperPage.awnser[qNumber-1] = 4;
                          });
                        },
                        child: Text(
                          '4   i am',
                          textAlign: TextAlign.start,
                        ),
                      ),
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
