import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/models/profile.dart';
import 'package:task/screens/home/todo.dart';

class prof extends StatelessWidget {

  final Profile profile; int ind;
  prof({required this.profile, required this.ind});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: Text('${profile.name}',style: TextStyle(color: Colors.white),),backgroundColor: Colors.transparent),
      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/profile2.png"),
              fit: BoxFit.fill,
            ),
          ),
      child: Container(
        child: Column(
            children: <Widget>[
              SizedBox(height: 300),
          Text('${profile.name}',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
          Text(
            'Codechef Star: ${profile.cc_rank}  \nRank on HackerEarth: ${profile.he_rank} \nPoints in APK Month: ${profile.apk_points}  \nFields of Interest: ${profile.interests} \nContact number: ${profile.pno}',
            style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
              SizedBox(height: 40),
            //   RaisedButton(
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            //   color:  Colors.white,
            //   child: Text(
            //     'To-do List',
            //     style: TextStyle(color: Colors.indigo[900], fontSize: 20.0),
            //   ),
            //   onPressed: (){} //=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoList()),),
            // ),
    ]),
    )));}}