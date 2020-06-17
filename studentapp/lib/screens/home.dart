import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/screens/welcome_page.dart';
import '../main.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends MyApp {
  static List<charts.Series<dynamic, String>>  seriesList =List<charts.Series<dynamic, String>>();
  @override
  _HomeState createState() {
    var homeState = _HomeState();
    return homeState;
  }

}

class _HomeState extends State<Home> {
  List<charts.Series> seriesList;
  bool animate = false;

  String id = '2020001A';
  @override
  void initState() {
    super.initState();
    
      _calculation();
    
  }

  Future _calculation() async {
    var i=1;
    List<OrdinalSales> data=[];
    await Firestore.instance.collection('class').document(StaticStudent.studentClass).collection('students').document(StaticStudent.studentId).collection('marks')
    .orderBy('createdAt',descending: true).limit(20).getDocuments().then((h) =>{
        
        h.documents.forEach((e) async =>{
          print(e.data['mark'].runtimeType),
          print(e.documentID.runtimeType),
          data.add(OrdinalSales(i.toString(),e.data['mark'])),
          i++
        })}).then((value) => {
          
    setState(() {
              
              Home.seriesList=  [
                new charts.Series<OrdinalSales, String>(
                  id: 'Desktop',
                  domainFn: (OrdinalSales sales, _) => sales.year,
                  measureFn: (OrdinalSales sales, _) => sales.sales,
                  data: data
                  )
                    
              ];
            }),
        }
      );

  }
  

  
  @override

  Widget build(BuildContext context) {
    print(Home.seriesList.runtimeType);
    Home.seriesList = Home.seriesList.reversed.toList();
    return SafeArea(
      child: SingleChildScrollView(
         
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Marks of Last 5 Paper',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
                Container(
                  height: 300,
                  child:  charts.BarChart(
                    Home.seriesList,
                    animate: true,
                    barGroupingType: charts.BarGroupingType.stacked,
                    primaryMeasureAxis: new charts.NumericAxisSpec(
                        tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                          <charts.TickSpec<num>>[
                            charts.TickSpec<num>(0),
                            charts.TickSpec<num>(20),
                            charts.TickSpec<num>(40),
                            charts.TickSpec<num>(60),
                            charts.TickSpec<num>(80),
                            charts.TickSpec<num>(100),
                          ],
                        ),
                      ),
                    
                    domainAxis: new charts.OrdinalAxisSpec(),
                    // Configure the axis spec to show percentage values.
                     
                  )
                    

                ),
                Container(
                  height: 170,
                  child: Image.asset("assets/logo2.png")
                  ),
              ],
            ),
          ),
        ),
      ));
  
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

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}