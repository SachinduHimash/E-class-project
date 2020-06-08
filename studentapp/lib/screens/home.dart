import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends MyApp {
  static List<ColumnSeries<OrdinalSales, String>>  seriesList =List<ColumnSeries<OrdinalSales, String>>();
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
              // Home.seriesList= [
              //     ColumnSeries<OrdinalSales, String>(
              //         dataSource:  data,
              //         isTrackVisible: true,
              //         trackColor: const Color.fromRGBO(198, 201, 207, 1),
              //         borderRadius: BorderRadius.circular(15),
              //         xValueMapper: (OrdinalSales sales, _) => sales.year,
              //         yValueMapper: (OrdinalSales sales, _) => sales.sales,
              //         name: 'Marks',
              //         dataLabelSettings: DataLabelSettings(
              //             isVisible: true,
              //             labelAlignment: ChartDataLabelAlignment.top,
              //             textStyle: ChartTextStyle(fontSize: 10, color: Colors.white)))
              //   ];
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
                 child:  
                    // SfCartesianChart(
                    //     // Initialize category axis
                    //     primaryXAxis: CategoryAxis(),
                    //     series: <ChartSeries>[
                    //         // Initialize line series
                    //         LineSeries<OrdinalSales, String>(
                    //             dataSource: [
                    //                 // Bind data source
                    //                 OrdinalSales('Jan', 35),
                    //                 OrdinalSales('Feb', 28),
                    //                 OrdinalSales('Mar', 34),
                    //                 OrdinalSales('Apr', 32),
                    //                 OrdinalSales('May', 40)
                    //             ],
                    //             xValueMapper: (OrdinalSales sales, _) => sales.year,
                    //             yValueMapper: (OrdinalSales sales, _) => sales.sales
                    //         )
                    //     ]
                    // )
                 
                //  SfCartesianChart(
                //     series: Home.seriesList,
                //     plotAreaBorderWidth: 0,
                //     title: ChartTitle(text: 'Marks of a student'),
                //     primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
                //     primaryYAxis: NumericAxis(
                //         minimum: 0,
                //         maximum: 100,
                //         axisLine: AxisLine(width: 0),
                //         majorGridLines: MajorGridLines(width: 0),
                //         majorTickLines: MajorTickLines(size: 0)),
                //   ),
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