import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/screens/authentication/signin.dart';
import 'package:task/screens/authentication/register.dart';
class Welcome extends StatefulWidget {
  // final Function toggleView;
  // Welcome({required this.toggleView});
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Widget buildLogInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn()),),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'SIGNIN',
          style: TextStyle(
              color: Colors.purple[400],
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()),),
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.purple[400],
        child: Text(
          'REGISTER',
          style: TextStyle(
              color: Color.fromRGBO(0, 29, 30, 11.8),
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
                  image: AssetImage("images/login.png"),
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
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 250),
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