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
      appBar: AppBar(title: Text("Your Profile",style: TextStyle(color: Colors.white60),),backgroundColor: Color.fromRGBO(92, 104, 211, .8),),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/login.png"),
              fit: BoxFit.cover,
            ),
          ),
      child: Column(
          children: <Widget>[
            SizedBox(height: 30),
        Text('${profile.name}',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
            Center(
                child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor:
                    Colors.white
                        .withOpacity(
                      0.3,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ))),
            SizedBox(height: 50),
        Text(
          'Codechef Star: ${profile.cc_rank}  \nRank on HackerEarth: ${profile.he_rank} \nPoints in APK Month: ${profile.apk_points}  \nFields of Interest: ${profile.interests} \nContact number: ${profile.pno}',
          style: TextStyle(color: Color.fromRGBO(92, 104, 211, .5),fontSize: 20,fontStyle: FontStyle.italic,),),
            SizedBox(height: 40),
            RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color:  Color.fromRGBO(92, 104, 211, .5),
            child: Text(
              'To-do List',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: (){} //=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoList()),),
          ),
    ])));}}