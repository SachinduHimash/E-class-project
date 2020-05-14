import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  

  final CollectionReference papaerCollection = Firestore.instance.collection('papers').document('11').collection('paperNumbers');

  getPaper(String paperNumber) async {
    papaerCollection.document(paperNumber);
  }
}