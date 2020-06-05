import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends MyApp {
  static List<charts.Series<OrdinalSales, String>>  seriesList =List<charts.Series<OrdinalSales, String>>();
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
    
    List<OrdinalSales> data=[];
    await Firestore.instance.collection('class').document('11.3').collection('students').document('2022003A').collection('marks')
    .orderBy('createdAt',descending: true).limit(1).getDocuments().then((h) =>{
        h.documents.forEach((e) async =>{
          print(e.data['mark'].runtimeType),
          print(e.documentID.runtimeType),
          data.add(OrdinalSales(e.documentID,50))
        })}).then((value) => {
          setState(() {
              //print('dd');
              Home.seriesList= [
              new charts.Series<OrdinalSales, String>(
                id: 'Sales',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (OrdinalSales sales, _) => sales.year,
                measureFn: (OrdinalSales sales, _) => sales.sales,
                labelAccessorFn: (OrdinalSales sales, _) =>
                      '${sales.sales.toString()}',
                data: data,
                
              )
              
            ];
            }),
        }
      );

  }
  

  
  @override

  Widget build(BuildContext context) {
    print(Home.seriesList.runtimeType);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: <Widget>[
               Text('Marks of Last 5 Paper'),
               Container(
                 height: 400,
                 child: charts.BarChart(
                          Home.seriesList,
                          animate: animate,
                          barGroupingType: charts.BarGroupingType.stacked,
                          // Configures a [PercentInjector] behavior that will calculate measure
                          // values as the percentage of the total of all data that shares a
                          // domain value.
                          behaviors: [
                            // new charts.PercentInjector<String>(
                            //     totalType: charts.PercentInjectorTotalType.domain)
                          ],
                          // Configure the axis spec to show percentage values.
                          primaryMeasureAxis: new charts.PercentAxisSpec(),
                          
                      ),
               )
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

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}