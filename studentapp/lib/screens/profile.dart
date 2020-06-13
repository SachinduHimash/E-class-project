import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:studentapp/screens/welcome_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Profile extends MyApp {

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
   final _height=MediaQuery.of(context).size.height;
   final _width=MediaQuery.of(context).size.width;

    return Scaffold(
      body:SingleChildScrollView(
        child:SafeArea(
            child: Column(
              
              children: <Widget>[
                
                Container(
                  margin: EdgeInsets.all(_height*0.06),
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
                        style: TextStyle( fontSize:_height*0.0275,color:Colors.black),
                        maxLines: 2,),
                      ),
                      Text("Your User ID :"+StaticStudent.studentId),
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
                Container(
                  // margin: EdgeInsets.all(_height*0.06),
                  height:_height*0.5,
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
                     Text("Change your Password",style: TextStyle(fontSize:_height*0.035,fontWeight:FontWeight.w400),),
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
                          )
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
                          )
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
     Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );

}
 void changePassword(){
   
 }
}


 