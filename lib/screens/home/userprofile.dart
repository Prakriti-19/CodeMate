import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/home/update.dart';

class Userprof extends StatefulWidget {

  String interests;
  String name;
  String cc;
  String he;
  String pno;
  String apk;
  Userprof({required this.interests,required this.cc,required this.he,required this.apk,required this.name,required this.pno});
  @override
  _UserprofState createState() => _UserprofState();
}

class _UserprofState extends State<Userprof> {
  @override
  Widget build(BuildContext context) {
    String interests=widget.interests;
    String name=widget.name;
    String cc=widget.cc;
    String he=widget.he;
    String pno=widget.pno;
    String apk=widget.apk;
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 57, 89, 1),
      body: Container(
          width: double.infinity,
          child: Container(
            child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/user.png'),
                  ),
                  SizedBox(height:50),
                  Text('${name}',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Codechef Stars: ',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
                      Text(
                        ' ${cc}',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hackerearth Rank: ',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
                      Text(
                        ' ${he}',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Apk Points: ',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
                      Text(
                        ' ${apk}',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Contact No.: ',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
                      Text(
                        ' ${pno}',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Interests: ',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
                      Text(
                        ' ${interests}',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  SizedBox(height: 40),

                   Row( mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color:  Colors.white,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.indigo[900],
                                  size: 19.0,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.indigo[900], fontSize: 20.0),
                                ),
                              ],
                            ),
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>update()));},
                        ),
                     ],
                   ),

                ]),
          )),
    );
  }
}
