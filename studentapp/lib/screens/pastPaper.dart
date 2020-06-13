import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/screens/welcome_page.dart';

import '../default_appbar_demo.dart';
import '../main.dart';
import 'answer_page.dart';
import 'answer_page40.dart';

class PaperList{
  final dynamic paperData;
  final String paperId;
  final List<int> anwser;

  const PaperList({
    @required this.paperData,
    @required this.paperId,
    this.anwser    
  });
}

class Visible{
  final String paperId;
  final bool visible;

  const Visible({
    this.paperId,
    this.visible
  });
}

class PastPaper extends MyApp {
  static List<dynamic> papers =List<dynamic>();
  static List<String> papersId = List<String>();
  static List<Visible> visible = List<Visible>();
  @override
  _PastPaperState createState() => _PastPaperState();
  

}

class _PastPaperState extends State<PastPaper> {
  List data;
  @override
  void initState() {
    super.initState();
    _calculation();
  }

  

  

  Future _calculation() async {
    
    var today;
    var classN = StaticStudent.studentClass;
    var grade = StaticStudent.studentClass.split('.')[0];
    var studentId = StaticStudent.studentId;
    
    if(PastPaper.papers.length == 0 ){
      await Firestore.instance.collection('paperAccess').document(grade).collection('day').getDocuments()
        .then((QuerySnapshot snapshot) {

            snapshot.documents.forEach((f)=> {
              PastPaper.papersId.add( f.data['paper']),
              print(f.documentID),
              PastPaper.visible.add(Visible(paperId: f.data['paper'],visible: f.data['pastPaper'])),
            });
            today =new DateTime.now().year.toString()+(new DateTime.now().month.toString().length == 1 ? '0'+new DateTime.now().month.toString():new DateTime.now().month.toString())+new DateTime.now().day.toString();
            print(today);

        }).catchError((ee) => print(ee)).then((e) async => {
                
              await Firestore.instance.collection('papers').document(grade).collection('paperNumbers').getDocuments()
                 .then((QuerySnapshot snapshot) async {
                   
                  snapshot.documents.forEach((f) async => {

                    print(f.documentID ),
                    if(PastPaper.papersId.indexOf(f.documentID) != -1){
                      await Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(f.documentID).get()
                        .then((h) => 
                          PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: new List<int>.from(h.data["answer"])))
                        ).catchError( (e) => {
                            
                            if(PastPaper.visible[PastPaper.visible.indexOf(PastPaper.visible.firstWhere((e) => e.paperId == f.documentID) )].visible == true){
                              if(f.data['questions'].length == 20){
                                 PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

                              } else {
                                 PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

                              }
                             
                            }

                          }
                        ).then((value) => setState(() {
                              DefaultAppBarDemo.pr.hide();
                              
                              data = PastPaper.papers;
                              
                          })
                        )
                      
                
                    }
              
                  });
                
            }).catchError((ee)=> {})
            
              
          // await Firestore.instance.collection('paperAccess').document(classN).collection('day').document(today).get()
          //   .then((g) async {
              
            //   await Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(g.data['paper']).get()
            //     .then((value) async => {
                  
            //       if(value.data == null){
                   
            //         await Firestore.instance.collection('papers').document(year).collection('paperNumbers').getDocuments()
            //           .then((QuerySnapshot snapshot) {
                        
            //             snapshot.documents.forEach((f) async => { 
                            

            //               if(PastPaper.papersId.indexOf(f.documentID) != -1 && g.data['paper'] != f.documentID){
                              
            //                 await Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(f.documentID).get()
            //                   .then((h) =>{
                                
            //                     PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: new List<int>.from(h.data["answer"])))
            //                     }
            //                   ).catchError( (e) => { 
                                  
                                  
            //                       if(PastPaper.visible[PastPaper.visible.indexOf(PastPaper.visible.firstWhere((e) => e.paperId == f.documentID) )].visible == true){
            //                         print('y'),
            //                         PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

            //                       }
                                  
            //                     }
            //                   ).then((value) => setState(() {
            //                         DefaultAppBarDemo.pr.hide();
                                    
            //                         data = PastPaper.papers;
                                    
            //                     })
            //                   )
                      
            //               }
            //             });
            //           }
            //         ).catchError((x)=> print(x))
            //       } else {
                    
            //         await Firestore.instance.collection('papers').document(year).collection('paperNumbers').getDocuments()
            //           .then((QuerySnapshot snapshot) {

            //             snapshot.documents.forEach((f) async => { 
                          
            //               if(PastPaper.papersId.indexOf(f.documentID) != -1){
                            
            //                 await Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(f.documentID).get()
            //                   .then((h) => {
                                
            //                     PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: new List<int>.from(h.data["answer"])))
            //                     }
            //                   ).catchError( (e) => {
                                  
            //                       if(PastPaper.visible[PastPaper.visible.indexOf(PastPaper.visible.firstWhere((e) => e.paperId == f.documentID) )].visible == true){
            //                         print('x'),
            //                         PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

            //                       }

            //                     }
            //                   ).then((value) => setState(() {
            //                       DefaultAppBarDemo.pr.hide();
                                  
            //                       data = PastPaper.papers;
                                  
            //                   })
            //                 )
            //               }
                    
            //             });
            //           })
            //       }
            //     });

            // }).catchError((err) async =>{

            //   await Firestore.instance.collection('papers').document(year).collection('paperNumbers').getDocuments()
            //      .then((QuerySnapshot snapshot) async {
                   
            //       snapshot.documents.forEach((f) async => {

            //         print(f.documentID ),
            //         if(PastPaper.papersId.indexOf(f.documentID) != -1){
            //           await Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(f.documentID).get()
            //             .then((h) => 
            //               PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: new List<int>.from(h.data["answer"])))
            //             ).catchError( (e) => {
                            
            //                 if(PastPaper.visible[PastPaper.visible.indexOf(PastPaper.visible.firstWhere((e) => e.paperId == f.documentID) )].visible == true){
            //                   print('7'),     
            //                   PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

            //                 }

            //               }
            //             ).then((value) => setState(() {
            //                   DefaultAppBarDemo.pr.hide();
                              
            //                   data = PastPaper.papers;
                              
            //               })
            //             )
                      
                
            //         }
              
            //       });
            //     })
            // }).catchError((ee)=> {})

        
      }).catchError((ee) => {});
      
      
    } else {
      
      print('dd');
      print(PastPaper.papers[0].paperId);
      //print(PastPaper.papers[1].paperId);
      print(PastPaper.papers[0].paperData);
      //print(PastPaper.papers[1].paperData);
      print(PastPaper.papers[0].anwser);
      //print(PastPaper.papers[1].anwser);
       setState(() {
          DefaultAppBarDemo.pr.hide().catchError((e)=>print(e));
          print(DefaultAppBarDemo.pr.isShowing());
          data = PastPaper.papers;
        });
    }
    

  }
  
  
  @override
  Widget build(BuildContext context) {
      
    
    if(data == null){
      return SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: <Widget>[
               
            
              ],
               )
          )
        )
      );

    } else {
      
      return SafeArea(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: 
              PastPaper.papers.map((i) => Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: new RaisedButton(
                  color: Colors.blue[400],
                  onPressed:() => { 
                   
                    
                    print(i.anwser),
                    if(i.paperData['questions'].length == 20) {
                      Navigator.of(context).push(CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          AnswerPage.qNumber = 0;
                          MyApp.page = 'PaperPage';
                          AnswerPage.answer= i.anwser;
                          AnswerPage.questions = i.paperData['questions'];
                          return AnswerPage();
                                     
                      },))
                      
                    } else {
                      Navigator.of(context).push(CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          AnswerPage40.qNumber = 0;
                          MyApp.page = 'PaperPage40';
                          AnswerPage40.answer= i.anwser;
                          AnswerPage40.questions = i.paperData['questions'];
                          return AnswerPage40();
                                     
                      },))
                    }        

                  },
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Text(i.paperId.toString(),
                          style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                        ),
                      )
                      
                    ],
                  )

                ),
              )).toList(),
            
          ),
        ),
      ),
    );
  
    }
    
    
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
