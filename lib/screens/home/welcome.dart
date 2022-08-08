import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/screens/authentication/signin.dart';
import 'package:task/screens/authentication/register.dart';
class Welcom extends StatefulWidget {
  // final Function toggleView;
  // Welcome({required this.toggleView});
  @override
  _WelcomState createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
  Widget buildLogInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn()),),
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.deepPurple,
        child: Text(
          'SIGNIN',
          style: TextStyle(
              color:  Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()),),
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.deepPurple,
        child: Text(
          'REGISTER',
          style: TextStyle(
              color:  Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/wel.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // child: SingleChildScrollView(
              //   physics: AlwaysScrollableScrollPhysics(),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 25,
              //     vertical: 50,
              //   ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  Text(
                    'Welcome Codies',
                    style: TextStyle(
                      //fontFamily: 'Mochiy Pop P One',
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 130),
                  buildLogInBtn(),
                  SizedBox(height: 5),
                  buildRegisterBtn(),
                ],
              ),
            ),

          ]),
        ),
      ),
    );
  }
}