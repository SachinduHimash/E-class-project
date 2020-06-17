import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:studentapp/screens/pastPaper.dart';
import 'package:studentapp/screens/rank.dart';
import 'dart:convert';
import '../main.dart';
import 'package:crypto/crypto.dart';
import 'package:studentapp/screens/welcome_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Profile extends MyApp {

  @override
  _ProfileState createState() => _ProfileState();
  

}

class _ProfileState extends State<Profile> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _autoValidate = false;
    String _password;
    String _compassword;
  
  @override
  Widget build(BuildContext context) {
    print('ffff');
   final _height=MediaQuery.of(context).size.height;
   final _width=MediaQuery.of(context).size.width;

    return Scaffold(
      body:SingleChildScrollView(
        child:SafeArea(
            child: Column(
              
              children: <Widget>[
                
                Container(
                  margin: EdgeInsets.only(left:_height*0.06,right:_height*0.06,top:_height*0.03,bottom: _height*0.03 ),
                  height:_height*0.2,
                  width:_width*0.8,
                  decoration:BoxDecoration(
                     color:Colors.blue[50],
                     shape: BoxShape.rectangle,
                     borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(25.0),
                         bottomRight: Radius.circular(25.0),
                         topRight:Radius.circular(25.0),
                         bottomLeft:Radius.circular(25.0))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:_height*0.01),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AutoSizeText(StaticStudent.studentFullname,
                        textAlign: TextAlign.center,
                        style: TextStyle( fontSize:_height*0.0275,color:Colors.black,fontWeight:FontWeight.bold),
                        maxLines: 2,),
                      ),
                      Text("Your User ID :"+StaticStudent.studentId,style: TextStyle(fontWeight:FontWeight.bold),),
                      SizedBox(height:_height*0.01),
                      RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                        onPressed:logout,
                        child: Text("Log out",style:TextStyle(color:Colors.white),),
                        color: Colors.blue[900],
                        )
                    

                      
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Container(
                    // margin: EdgeInsets.all(_height*0.06),
                    height:_height*0.53,
                    width:_width*0.8,
                    decoration:BoxDecoration(
                       color:Colors.blue[50],
                       shape: BoxShape.rectangle,
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(25.0),
                           bottomRight: Radius.circular(25.0),
                           topRight:Radius.circular(25.0),
                           bottomLeft:Radius.circular(25.0))),
                    child: Column(
                     children: <Widget>[
                       SizedBox(height:_height*0.03),
                       Text("Change your Password",style: TextStyle(fontSize:_height*0.035,fontWeight:FontWeight.bold),),
                       SizedBox(height:_height*0.03),
                       Container(
                            width:_width*0.53,
                            child:TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                              labelText: 'New Password',
                              fillColor: Colors.blue,
                              
                              
                              ),
                              validator:validatePassword,
                              onSaved: (String val) {
                                _password = val;
                              }
                            ),
                          ),
                       SizedBox(height:_height*0.03),
                       Container(
                            width:_width*0.53,
                            child:TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              fillColor: Colors.blue,
                              
                              
                              ),
                              validator:validatePassword,
                              onSaved: (String val) {
                                _compassword = val;
                                }
                              ),
                            ),
                       SizedBox(height:_height*0.03),
                       RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                          onPressed:changePassword,
                          child: Text("Change Password",style:TextStyle(color:Colors.white),),
                          color: Colors.blue[900],
                          )
                     ]
                    ),
                  ),
                )
              ]
            ),
       ),
           
      )
    ); 
  }

  void logout(){
    StaticStudent.logged=false;
    StaticStudent.studentId=null;
    StaticStudent.studentAddress=null;
    StaticStudent.studentClass=null;
    StaticStudent.studentFullname=null;
    StaticStudent.studentSchool=null;
    PastPaper.papers =List<dynamic>();
    PastPaper.papersId = List<String>();
    PastPaper.visible = List<Visible>();
    PastPaper.val =false;
    Rank.ranks =List<dynamic>();
    Rank. paper = null;
     Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );

}
  dynamic changePassword() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
     
      if(_password == _compassword){
       
        await Firestore.instance.collection('users').document(StaticStudent.studentId).updateData({"password": md5.convert(utf8.encode(_password)).toString()});
        Alert(
          context: context,
          type: AlertType.success,
          title: "Your Password Has been Changed",
          
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Your Password Has not been Changed",
          desc: "Passwords doesn't match",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
    }
  }
 }
 String validatePassword(String value) {
    if (value.length < 8)
      return 'Invalid Password';
    else
      return null;
  }
}


 