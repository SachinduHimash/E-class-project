import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studentapp/screens/rank.dart';
import 'package:studentapp/model/user.dart';

class DatabaseService{
  

  final CollectionReference papaerCollection = Firestore.instance.collection('papers').document('11').collection('paperNumbers');
  final CollectionReference studentCollection = Firestore.instance.collection('users');

  getPaper(String paperNumber) async {
    papaerCollection.document(paperNumber);
  }
  Future<DocumentSnapshot> getDocumentById(String id)async {
    return studentCollection.document(id).get();
  }
   Future <Student> getUserById(String id) async {
    var doc = await getDocumentById(id);
    return  Student.fromMap(doc.data, doc.documentID) ;
  }
}