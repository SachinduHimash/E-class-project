import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:studentapp/service/database.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:studentapp/model/user.dart';

import '../default_appbar_demo.dart';


class StaticStudent {
  static bool logged=false;
  static String studentId;
  static String studentFullname;
  static String studentClass;
  static String studentSchool;
  static String studentAddress;
  
}


class WelcomePage extends  StatefulWidget {
  WelcomePage({Key key}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _userID;
  String _password;
  


  @override
  Widget build(BuildContext context) {
   final _height=MediaQuery.of(context).size.height;
   final _width=MediaQuery.of(context).size.width;

    return WillPopScope(
         onWillPop: () async => false,
        child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.fill)
            ),
            width: _width,
            height: _height,
            child: SafeArea(
             child: Column(
              children: <Widget>[
              SizedBox(
                height: _height*0.01,
              ),
              Container(
                       
                       child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText("Welcome",
                          style:TextStyle(color: Colors.blue[900],fontSize: _height*0.075,fontFamily: 'Pacifico')),
                          
                          AutoSizeText("Please login to access your paper",
                          maxLines: 2,
                          style:TextStyle(color: Colors.blue[700],fontSize: _height*0.03))
                        ]
                       )
                      ),
              SizedBox(
                       height:_height*0.43,
                     ),
              Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  children: <Widget>[
                     Container(
                       margin: EdgeInsets.only(bottom:_height*0.01),
                       width: _width*0.75 ,
                       color: Colors.lightBlue[50],
                       child:Row(
                         children: <Widget>[
                            SizedBox(width:_width*0.05),
                            Icon(
                              Icons.person,
                              color: Colors.blue[900],),
                            SizedBox(width:_width*0.05),
                            Container(
                     
                              width: _width*0.53,
                              child:TextFormField(
                               keyboardType: TextInputType.emailAddress,
                               decoration: InputDecoration(
                               labelText: 'UserID',
                               fillColor: Colors.blue,
                               ),
                               validator: validateUserId,
                                onSaved: (String val) {
                                  _userID = val;
                                },
                              ),
                            )
                          ]
                       )
                     ),
              
                     Container(
                       width:_width*0.75 ,
                       margin: EdgeInsets.only(bottom:_height*0.02),
                       color: Colors.lightBlue[50],
                       child:Row(
                         children: <Widget>[
                         SizedBox(width:_width*0.05),
                         Icon(
                            Icons.lock,
                            color: Colors.blue[900],),
                         SizedBox(width:_width*0.05),
                         Container(
                            width:_width*0.53,
                            child:TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                              labelText: 'Password',
                              fillColor: Colors.blue,
                              
                              
                            ),
                            validator:validatePassword,
                            onSaved: (String val) {
                              _password = val;}
                            ),
                          )
                         ]
                       )
                     ),
                     RaisedButton(
                       padding: EdgeInsets.fromLTRB(_width*0.1,_height*0.02,_width*0.1,_height*0.02),
                       shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                       onPressed: _submit,
                       color: Colors.blue[900],
                       child: Text(
                         "Login",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 20.0,
                         ),
                       ),)
                  ],))
              
             ],
              
            
            ),
          ),
          ),
        ),
        
      ),
    );
  }

 //submit

  Future<void> _submit() async {
  if (_formKey.currentState.validate()) {

    _formKey.currentState.save();
   final _password2=generateMd5(_password);
   
   Student _student = await DatabaseService().getUserById(_userID);

   if(_student != null){
     if(_password2==_student.password){
       StaticStudent.studentId=_student.id;
       StaticStudent.studentFullname=_student.fullname;
       StaticStudent.studentClass=_student.clas;
       StaticStudent.studentAddress=_student.address;
       StaticStudent.studentSchool=_student.school;
       StaticStudent.logged=true;
      
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DefaultAppBarDemo()),
        );
     }else{
       Alert(
          context: context,
          type: AlertType.error,
          title: "Your Password is incorrect",
          
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
      
  } else {
    //    If all data are not valid then start auto validation.
        
    setState(() {
          _autoValidate = true;
        });
      }
    }
    
     
}
String validateUserId(String value) {
    Pattern pattern =
        "202+([0-9]){4}([A-Z]){1}";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter a valid UserID';
    else
      return null;
  }

String validatePassword(String value) {
    
    if (value.length < 8)
      return 'Invalid Password';
    else
      return null;
  }

 String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}