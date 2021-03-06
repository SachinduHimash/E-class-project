import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:studentapp/screens/welcome_page.dart';
import '../default_appbar_demo.dart';
import '../main.dart';

class User{
  final String name;
  final int rank;
  final int mark;

  const User({
    this.name,
    this.rank,
    this.mark
  });
}

class Rank extends MyApp {
  static List<dynamic> ranks =List<dynamic>();
  static dynamic paper;
  @override
  _RankState createState() => _RankState();

}

class _RankState extends State<Rank> {
  List data;
  String id = StaticStudent.studentId;
  @override
  void initState() {
   
    super.initState();
    
      _calculation();
    
  }

  Future _calculation() async {
    if(Rank.ranks.isEmpty){
      print('1');
      await Firestore.instance.collection('ranking').document(StaticStudent.studentClass.split('.')[0]).collection('rank').orderBy('createdAt',descending: true).limit(1).getDocuments().then((h) =>{
        
        h.documents.forEach((e) async =>{
          Rank.paper=e.data['paper'],
          e.data['rank'].forEach((s)=>{
            if(s['rank']<=10){
              Rank.ranks.add(User(name: s['name'],rank: s['rank'],mark: s['mark'])),
              if(StaticStudent.studentId == s['id']){
                this.id = s['name']
              }
            } else {
              
              Rank.ranks.add(User(name: s['id'],rank: s['rank'],mark: s['mark']))
            }
          }),
          
        })
      }).then((value) => {
        setState(() {
          print('4');
            DefaultAppBarDemo.pr.hide();
            print(DefaultAppBarDemo.pr.isShowing());
            print(DefaultAppBarDemo.load);
            data =  Rank.ranks;
          }),
      }
      );
    } else {
      print('2');
      setState(()  {
        print('3');
        DefaultAppBarDemo.pr.hide();
        print(DefaultAppBarDemo.pr.isShowing());
        print(DefaultAppBarDemo.load);
        data =  Rank.ranks;
        
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
      data = data.toList();
      
      return SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(Rank.paper.toString() + " Paper Rank",
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('rank')),
                            DataColumn(label: Text('name')),
                            DataColumn(label: Text('marks')),
                          ],
                          rows:
                              data // Loops through dataColumnText, each iteration assigning the value to element
                                  .map(
                                    ((element) => 
                                        element.name == this.id ?
                                        DataRow(
                                          selected: true,
                                          cells: <DataCell>[
                                            DataCell(Text(element.rank.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 22,color: Colors.blue[900]),)),
                                            DataCell(Text(element.name,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.blue[900]),)), //Extracting from Map element the value
                                            DataCell(Text(element.mark.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 22,color: Colors.blue[900]),)),
                                          ],
                                        ):
                                        DataRow(
                                      
                                          cells: <DataCell>[
                                            DataCell(Text(element.rank.toString(),style: TextStyle(fontWeight:FontWeight.w700,fontSize: 17),)),
                                            DataCell(Text(element.name,style: TextStyle(fontWeight:FontWeight.w700,fontSize: 16),)), //Extracting from Map element the value
                                            DataCell(Text(element.mark.toString(),style: TextStyle(fontWeight:FontWeight.w700,fontSize: 17),)),
                                          ],
                                        )
                                      ),
                                  )
                                  .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
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
