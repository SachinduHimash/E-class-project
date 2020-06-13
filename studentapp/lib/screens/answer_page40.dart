import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

import '../main.dart';
import 'answerQustionSelcet40.dart';

class AnswerPage40 extends  MyApp{
  static double qNumber;
    static dynamic questions;
    static dynamic marks;
    static List<int> answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    @override
    _AnswerPage40State createState() => _AnswerPage40State();
  }

class _AnswerPage40State extends State<AnswerPage40> {
   
  PageController _controller;
  

  @override
  void initState() {
   
    if(AnswerPage40.qNumber != null){

       _controller = PageController(initialPage: AnswerPage40.qNumber.round());
    
    } else {
      _controller = PageController();
    }
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
    setState(() {
      AnswerPage40.qNumber = _controller.page;
    });
  });
    List<Widget> items = [
      buildPage(1,AnswerPage40.questions[0], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(2,AnswerPage40.questions[1], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(3,AnswerPage40.questions[2], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(4,AnswerPage40.questions[3], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(5,AnswerPage40.questions[4], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(6,AnswerPage40.questions[5], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(7,AnswerPage40.questions[6], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(8,AnswerPage40.questions[7], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(9,AnswerPage40.questions[8], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(10,AnswerPage40.questions[9], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(11,AnswerPage40.questions[10], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(12,AnswerPage40.questions[11], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(13,AnswerPage40.questions[12], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(14,AnswerPage40.questions[13], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(15,AnswerPage40.questions[14], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(16,AnswerPage40.questions[15], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(17,AnswerPage40.questions[16], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(18,AnswerPage40.questions[17], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(19,AnswerPage40.questions[18], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(20,AnswerPage40.questions[19], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(21,AnswerPage40.questions[0], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(22,AnswerPage40.questions[1], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(23,AnswerPage40.questions[2], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(24,AnswerPage40.questions[3], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(25,AnswerPage40.questions[4], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(26,AnswerPage40.questions[5], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(27,AnswerPage40.questions[6], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(28,AnswerPage40.questions[7], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(29,AnswerPage40.questions[8], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(30,AnswerPage40.questions[9], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(31,AnswerPage40.questions[10], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(32,AnswerPage40.questions[11], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(33,AnswerPage40.questions[12], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(34,AnswerPage40.questions[13], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(35,AnswerPage40.questions[14], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(36,AnswerPage40.questions[15], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(37,AnswerPage40.questions[16], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(38,AnswerPage40.questions[17], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(39,AnswerPage40.questions[18], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(40,AnswerPage40.questions[19], Color.fromRGBO(10, 10, 10,0.1)),
    ];
    var marks = 0.0;
    for (var i = 0; i < AnswerPage40.answer.length; i++) {
      if(AnswerPage40.answer[i] == AnswerPage40.questions[i]['correctAnswer']){
          marks+=2.5;
      }
    }
    AnswerPage40.marks = marks;
    

    if( AnswerPage40.qNumber == 39){
      return new  MaterialApp(
        home: Scaffold(
          body: SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                     Row(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                            child: Text("your marks is  " +AnswerPage40.marks.toString()+' %',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),
                            ),
                          ),
                        )
                      ],),
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
                                    AnswerPage40.qNumber = _controller.page - 1;
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
                                      AnswerPage40.qNumber = _controller.page;
                                      print(AnswerPage40.qNumber);
                                      MyApp.page = 'AnswerQustionSelect40';
                                      return AnswerQustionSelect40();
                                    },
                                  ));
                                  },
                                ),
                                RaisedButton(
                                  color: Colors.blueGrey[900],
                                  child: Text(
                                    'Finish',
                                    style: TextStyle(color: Colors.white),

                                  ),
                                  onPressed: () { 
                                    Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) {
                                        MyApp.page = 'myapp';
                                        AnswerPage40.qNumber = 0;
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
      );
    } else if(AnswerPage40.qNumber == 0 ) {
      return new MaterialApp(
        home: Scaffold(
          body: SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                     Row(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                            child: Text("your marks is  " +AnswerPage40.marks.toString()+' %',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),
                            ),
                          ),
                        )
                      ],),
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
                                      AnswerPage40.qNumber = _controller.page;
                                      print(AnswerPage40.qNumber);
                                      MyApp.page = 'AnswerQustionSelect40';
                                      return AnswerQustionSelect40();
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
                                    AnswerPage40.qNumber = _controller.page + 1;
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
      return new MaterialApp(
        home: Scaffold(
          body: SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                     Row(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                            child: Text("your marks is  " +AnswerPage40.marks.toString()+' %',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),
                            ),
                          ),
                        )
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
                                    AnswerPage40.qNumber = _controller.page - 1;
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
                                      AnswerPage40.qNumber = _controller.page;
                                      print(AnswerPage40.qNumber);
                                      MyApp.page = 'AnswerQustionSelect40';
                                      return AnswerQustionSelect40();
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
                                    AnswerPage40.qNumber = _controller.page + 1;
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
                               padding: EdgeInsets.fromLTRB(20, 30, 20, 5),
                               child: Row(
                                 children: <Widget>[
                                  Icon(AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ?  Icons.assignment_turned_in :(AnswerPage40.answer[qNumber-1] == 0? Icons.assignment_late: Icons.cancel),
                                    color: AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ? Colors.green :(AnswerPage40.answer[qNumber-1] == 0? Colors.amber: Colors.red)  
                                  ),
                                  SizedBox(width: 20,),
                                  Text(AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ? 'correct':(AnswerPage40.answer[qNumber-1] == 0? 'not attempted': 'wrong'),
                                    style: TextStyle(color: AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ? Colors.green :(AnswerPage40.answer[qNumber-1] == 0? Colors.amber: Colors.red),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                 ],
                               )
                               
                            )
                          ],
                        ),
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
                                  color: qContent['correctAnswer'] == 1 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 1 ?Colors.red[300]: Colors.amber),
                                  onPressed: () {
                                    
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
                                  color:  qContent['correctAnswer'] == 2 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 2 ?Colors.red[300]: Colors.amber),
                                  onPressed: () {
                                   
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
                              color:  qContent['correctAnswer'] == 3 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 3 ?Colors.red[300]: Colors.amber),
                              onPressed: () {
                                
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
                              color:  qContent['correctAnswer'] == 4 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 4 ?Colors.red[300]: Colors.amber),
                              onPressed: () {
                                
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
                               child: Row(
                                 children: <Widget>[
                                  Icon(AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ?  Icons.assignment_turned_in :(AnswerPage40.answer[qNumber-1] == 0? Icons.assignment_late: Icons.cancel),
                                    color: AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ? Colors.green :(AnswerPage40.answer[qNumber-1] == 0? Colors.amber: Colors.red)  
                                  ),
                                  SizedBox(width: 20,),
                                  Text(AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ? 'correct':(AnswerPage40.answer[qNumber-1] == 0? 'not attempted': 'wrong'),
                                    style: TextStyle(color: AnswerPage40.answer[qNumber-1] == qContent['correctAnswer'] ? Colors.green :(AnswerPage40.answer[qNumber-1] == 0? Colors.amber: Colors.red),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                 ],
                               )
                               
                            )
                          ],
                        ),
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
                                  color:  qContent['correctAnswer'] == 1 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 1 ?Colors.red[300]: Colors.amber),
                                  onPressed: () {
                                    
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
                                  color:  qContent['correctAnswer'] == 2 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 2 ?Colors.red[300]: Colors.amber),
                                  onPressed: () {
                                    
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
                              color:  qContent['correctAnswer'] == 3 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 3 ?Colors.red[300]: Colors.amber),
                              onPressed: () {
                                
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
                              color:  qContent['correctAnswer'] == 4 ?  Colors.green[400] :(AnswerPage40.answer[qNumber-1] == 4 ?Colors.red[300]: Colors.amber),
                              onPressed: () {
                                
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
