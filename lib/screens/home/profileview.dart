import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/models/profile.dart';
import 'package:task/screens/home/mail.dart';
import 'package:task/screens/home/todo.dart';

class prof extends StatelessWidget {

  final Profile profile; int ind;
  prof({required this.profile, required this.ind});

  @override
  Widget build(BuildContext context) {
    String a=profile.gender;
    String image;
    if(a=='Female')
      image = "images/female.png";
    else
      image = "images/male.png";
    return Scaffold(
    //  appBar: AppBar(title: Text('${profile.name}',style: TextStyle(color: Colors.white),),backgroundColor: Colors.transparent),
      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
      child: Container(
        child: Column(
            children: <Widget>[
              SizedBox(height: 300),
          Text('${profile.name}',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Codechef Stars: ',
                    style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
                  Text(
                    ' ${profile.cc_rank}',
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
                    ' ${profile.he_rank}',
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
                    ' ${profile.apk_points}',
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
                    ' ${profile.pno}',
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
                    ' ${profile.interests}',
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                ],
              ),
              SizedBox(height: 5),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email: ',
                    style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,),),
                  Text(
                    ' ${profile.email}',
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                ],
              ),
              SizedBox(height: 30),
              RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color:  Colors.white,
              child: Text(
                'Project Collaboration',
                style: TextStyle(color: Colors.indigo[900], fontSize: 20.0),
              ),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>mail(profile: profile)),);}
            ),
    ]),
    )));}}