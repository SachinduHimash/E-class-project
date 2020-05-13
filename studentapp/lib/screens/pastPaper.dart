import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'paper_page.dart';
import 'paper_page40.dart';

class PaperList{
  final dynamic paperData;
  final String paperId;
  final List<dynamic> anwser;

  const PaperList({
    @required this.paperData,
    @required this.paperId,
    this.anwser    
  });
}

class PastPaper extends MyApp {
  static List<dynamic> papers =List<dynamic>();
  static List<String> papersId = List<String>();
  @override
  _PastPaperState createState() => _PastPaperState();
  

}

class _PastPaperState extends State<PastPaper> {
   
  @override
  Widget build(BuildContext context) {
    var today;
    var classN = '9.1';
    var year = '11';
    var studentId = '2022001A';
    if(PastPaper.papers.length == 0 ){
      Firestore.instance.collection('paperAccess').document(classN).collection('day').getDocuments()
        .then((QuerySnapshot snapshot) {

            snapshot.documents.forEach((f)=> {
              PastPaper.papersId.add(f.data['paper']),
              
            });
            today =new DateTime.now().year.toString()+(new DateTime.now().month.toString().length == 1 ? '0'+new DateTime.now().month.toString():new DateTime.now().month.toString())+new DateTime.now().day.toString();
            print(today);

        }).catchError((ee) => print(ee)).then((e) => {
             
          Firestore.instance.collection('paperAccess').document(classN).collection('day').document(today).get()
            .then((g) async {

              
              await Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(g.data['paper']).get()
                .then((value) => {
                  
                  if(value.data == null){
                   
                    Firestore.instance.collection('papers').document(year).collection('paperNumbers').getDocuments()
                      .then((QuerySnapshot snapshot) {
                        
                        snapshot.documents.forEach((f)=> { 
                            

                          if(PastPaper.papersId.indexOf(f.documentID) != -1 && g.data['paper'] != f.documentID){
                              
                             Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(f.documentID).get()
                              .then((h) =>{
                                
                                PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser:  h.data["answer"]))
                                }
                              ).catchError( (e) => { 
                                  
                                  PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

                                }
                              )
                      
                          }
                        });
                      }
                    ).catchError((x)=> print(x))
                  } else {
                    
                    Firestore.instance.collection('papers').document(year).collection('paperNumbers').getDocuments()
                      .then((QuerySnapshot snapshot) {

                        snapshot.documents.forEach((f)=> { 
                          
                          if(PastPaper.papersId.indexOf(f.documentID) != -1){
                            
                            Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(f.documentID).get()
                              .then((h) => {
                                
                                PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser:  h.data["answer"]))
                                }
                              ).catchError( (e) => {
                                  PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

                                }
                              )
                          }
                    
                        });
                      })
                  }
                });

            }).catchError((err) =>{

              Firestore.instance.collection('papers').document(year).collection('paperNumbers').getDocuments()
                 .then((QuerySnapshot snapshot) {
                   
                  snapshot.documents.forEach((f)=> {

                    print(f.documentID ),
                    if(PastPaper.papersId.indexOf(f.documentID) != -1){
                      Firestore.instance.collection('class').document(classN).collection('students').document(studentId).collection('marks').document(f.documentID).get()
                        .then((h) => 
                          PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser:  h.data["answer"]))
                        ).catchError( (e) => {
                            
                            PastPaper.papers.add(PaperList(paperData: f.data,paperId: f.documentID,anwser: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))

                          }
                        )
                      
                
                    }
              
                  });
                })
            }).catchError((ee)=> {})

        
      }).catchError((ee) => {});
      
      
    } else {
      print(PastPaper.papers[0].paperId);
      //print(PastPaper.papers[1].paperId);
      print(PastPaper.papers[0].paperData);
      //print(PastPaper.papers[1].paperData);
      print(PastPaper.papers[0].anwser);
      //print(PastPaper.papers[1].anwser);
    }
    // PastPaper.papersId.forEach((element) {
    //   if(element == ){

    //   }
    // });
    
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed:() => { 

                },
                padding: EdgeInsets.all(30),
                child: Row(
                  children: <Widget>[
                    Text('PastPaper',
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
                    
                  ],
                )

              ),
            ],
          ),
        ),
      ),
    );
  
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
