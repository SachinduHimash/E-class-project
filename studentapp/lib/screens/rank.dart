import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../default_appbar_demo.dart';
import '../main.dart';

class User{
  final String name;
  final int rank;

  const User({
    this.name,
    this.rank
  });
}

class Rank extends MyApp {
  static List<dynamic> ranks =List<dynamic>();
  @override
  _RankState createState() => _RankState();

}

class _RankState extends State<Rank> {
  List data;
  @override
  void initState() {
    super.initState();
    _calculation();
  }

  Future _calculation() async {
    print(DateTime.now());
    await Firestore.instance.collection('ranking').getDocuments().then((h) =>{
      h.documents.forEach((e) async =>{
        
        e.data['rank'].forEach((s)=>{
           Rank.ranks.add(User(name: s['name'],rank: s['rank']))
          //print(s.toString())
        }),
        print(DateTime.now())
      })
    }).then((value) => {
       setState(() {
          DefaultAppBarDemo.pr.hide();
           data =  Rank.ranks;
        }),
    }
    );
    
  }
  
  @override
  Widget build(BuildContext context) {
    print(Rank.ranks);
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
      print('gg');
      
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
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Patch')),
                            DataColumn(label: Text('Version')),
                          ],
                          rows:
                              data // Loops through dataColumnText, each iteration assigning the value to element
                                  .map(
                                    ((element) => 
                                        element.name == 'Maciunas' ?
                                        DataRow(
                                          selected: true,
                                          cells: <DataCell>[
                                            DataCell(Text(element.name,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)), //Extracting from Map element the value
                                            DataCell(Text(element.rank.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)),
                                          ],
                                        ):
                                        DataRow(
                                      
                                          cells: <DataCell>[
                                            DataCell(Text(element.name,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)), //Extracting from Map element the value
                                            DataCell(Text(element.rank.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)),
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
