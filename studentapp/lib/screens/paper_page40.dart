import 'package:cloud_functions/cloud_functions.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:studentapp/screens/qustionSelcet40.dart';
import 'package:studentapp/screens/welcome_page.dart';
import '../main.dart';
import 'package:studentapp/screens/pastPaper.dart';

class PaperPage40 extends  MyApp{
  static double qNumber;
    static dynamic questions;
    static dynamic endTime;
    static dynamic paperNumber;
    static bool timeout;
    static List<int> answer= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    @override
    _PaperPage40State createState() => _PaperPage40State();
  }

class _PaperPage40State extends State<PaperPage40> {
   
  PageController _controller;
  

  @override
  void initState() {
   
    if(PaperPage40.qNumber != null){

       _controller = PageController(initialPage: PaperPage40.qNumber.round());
    
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
      PaperPage40.qNumber = _controller.page;
    });
  });
    List<Widget> items = [
      buildPage(1,PaperPage40.questions[0], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(2,PaperPage40.questions[1], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(3,PaperPage40.questions[2], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(4,PaperPage40.questions[3], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(5,PaperPage40.questions[4], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(6,PaperPage40.questions[5], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(7,PaperPage40.questions[6], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(8,PaperPage40.questions[7], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(9,PaperPage40.questions[8], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(10,PaperPage40.questions[9], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(11,PaperPage40.questions[10], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(12,PaperPage40.questions[11], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(13,PaperPage40.questions[12], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(14,PaperPage40.questions[13], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(15,PaperPage40.questions[14], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(16,PaperPage40.questions[15], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(17,PaperPage40.questions[16], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(18,PaperPage40.questions[17], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(19,PaperPage40.questions[18], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(20,PaperPage40.questions[19], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(21,PaperPage40.questions[20], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(22,PaperPage40.questions[21], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(23,PaperPage40.questions[22], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(24,PaperPage40.questions[23], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(25,PaperPage40.questions[24], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(26,PaperPage40.questions[25], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(27,PaperPage40.questions[26], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(28,PaperPage40.questions[27], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(29,PaperPage40.questions[28], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(30,PaperPage40.questions[29], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(31,PaperPage40.questions[30], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(32,PaperPage40.questions[31], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(33,PaperPage40.questions[32], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(34,PaperPage40.questions[33], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(35,PaperPage40.questions[34], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(36,PaperPage40.questions[35], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(37,PaperPage40.questions[36], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(38,PaperPage40.questions[37], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(39,PaperPage40.questions[38], Color.fromRGBO(10, 10, 10,0.1)),
      buildPage(40,PaperPage40.questions[39], Color.fromRGBO(10, 10, 10,0.1)),
    ];

    if(PaperPage40.endTime.difference(DateTime.now()).toString()[0]=='-'){
      return SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: WillPopScope(
              onWillPop: () {  },
                          child: AlertDialog(
                                title: Text('Time out',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('paper is over'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    color: Colors.blue[900],
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
      if( PaperPage40.qNumber == 39){
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
                                duration: PaperPage40.endTime.difference(DateTime.now()),
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
                                      PaperPage40.qNumber = _controller.page - 1;
                                      
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
                                        PaperPage40.qNumber = _controller.page;
                                        print(PaperPage40.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect40();
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
                                      var marks =0.0;
                                      if(PaperPage40.answer.indexOf(0) == -1){
                                        PaperPage40.qNumber = null;
                                        for (var i = 0; i < PaperPage40.answer.length; i++) {
                                          if(PaperPage40.answer[i] == PaperPage40.questions[i]['correctAnswer']){
                                            marks+=2.5;
                                          
                                          }
                                          
                                          
                                        }
                                        dynamic resp = await callable.call(<String, dynamic>{
                                          'userID': StaticStudent.studentId,
                                          'class': StaticStudent.studentClass,
                                          'grade': StaticStudent.studentClass.split('.')[0],
                                          'paperNumber': PaperPage40.paperNumber,
                                          'photo': '',
                                          'school': StaticStudent.studentSchool,
                                          'marks':marks,
                                          'answer' : PaperPage40.answer,
                                          'name': StaticStudent.studentFullname,

                                        });
                                         PastPaper.papers =List<dynamic>();
                                          PastPaper.papersId = List<String>();
                                          PastPaper.visible = List<Visible>();
                                          PastPaper.val =false;
                                        
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Marks',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text('Your Mark is $marks'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                RaisedButton(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                  color: Colors.blue[900],
                                                  child: Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).push(CupertinoPageRoute(
                                                          fullscreenDialog: true,
                                                          builder: (BuildContext context) {
                                                            MyApp.page = 'myapp';
                                                            PaperPage40.qNumber = 0;
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
                                              title: Text('Paper not Completed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text('You must complete every question'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                RaisedButton(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                  color: Colors.blue[900],
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
      } else if(PaperPage40.qNumber == 0 ) {
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
                                duration: PaperPage40.endTime.difference(DateTime.now()),
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
                                        PaperPage40.qNumber = _controller.page;
                                        print(PaperPage40.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect40();
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
                                      PaperPage40.qNumber = _controller.page + 1;
                                      
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
                                duration: PaperPage40.endTime.difference(DateTime.now()),
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
                                      PaperPage40.qNumber = _controller.page - 1;
                                      
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
                                        PaperPage40.qNumber = _controller.page;
                                        print(PaperPage40.qNumber);
                                        MyApp.page = 'QustionSelect';
                                        return QustionSelect40();
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
                                      PaperPage40.qNumber = _controller.page + 1;
                                      
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
                                  color: PaperPage40.answer[qNumber-1] == 1 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage40.answer[qNumber-1] = 1;
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
                                  color: PaperPage40.answer[qNumber-1] == 2 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage40.answer[qNumber-1] = 2;
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
                              color: PaperPage40.answer[qNumber-1] == 3 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage40.answer[qNumber-1] = 3;
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
                              color: PaperPage40.answer[qNumber-1] == 4 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage40.answer[qNumber-1] = 4;
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
                                  color: PaperPage40.answer[qNumber-1] == 1 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage40.answer[qNumber-1] = 1;
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
                                  color: PaperPage40.answer[qNumber-1] == 2 ?  Colors.green[400] : Colors.amber,
                                  onPressed: () {
                                    
    setState(() {
                                      PaperPage40.answer[qNumber-1] = 2;
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
                              color: PaperPage40.answer[qNumber-1] == 3 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage40.answer[qNumber-1] = 3;
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
                              color: PaperPage40.answer[qNumber-1] == 4 ?  Colors.green[400] : Colors.amber,
                              onPressed: () {
                                
    setState(() {
                                  PaperPage40.answer[qNumber-1] = 4;
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
    print('dd');
    if(!PaperPage40.timeout){
       print('dddd');
      PaperPage40.timeout =true;
      var marks = 0.0;
      final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
        functionName: 'login/marks',
      );
      PaperPage40.qNumber = null;
      for (var i = 0; i < PaperPage40.answer.length; i++) {
        if(PaperPage40.answer[i] == PaperPage40.questions[i]['correctAnswer']){
          marks+=2.5;
        }
      }
      callable.call(<String, dynamic>{
        'userID': StaticStudent.studentId,
        'class': StaticStudent.studentClass,
        'grade': StaticStudent.studentClass.split('.')[0],
        'paperNumber': PaperPage40.paperNumber,
        'photo': '',
        'school': StaticStudent.studentSchool,
        'marks':marks,
        'answer' : PaperPage40.answer,
        'name': StaticStudent.studentFullname,

      });
    }
  }
}
