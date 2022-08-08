import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:task/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:task/screens/authentication/register.dart';
//import 'package:task/screens/home/home.dart';
import 'package:task/shared/loading.dart';
import 'package:task/homeScreen.dart';

class signIn extends StatefulWidget {
  // final Function toggleView;
  // signIn({required this.toggleView});
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  bool loading = false;
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body:
            Stack(
              children: <Widget>[
                  new Container(
                             padding:
                                 EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/login.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              ),
                              SingleChildScrollView(
                                child: new Container(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                                  color: Colors.transparent,
                                  child: Form(
                                      key: _formKey,
                                      child: Column(children: <Widget>[
                                        SizedBox(height: 260.0),
                                        TextFormField(
                                          //decoration: textInputDecoration.copyWith(hintText: 'email'),
                                          validator: (val) =>
                                              val!.isEmpty ? 'Enter an email' : null,
                                          onChanged: (val) {
                                            setState(() => email = val);
                                          },
                                        ),
                                        SizedBox(height: 20.0),
                                        TextFormField(
                                          //decoration: textInputDecoration.copyWith(hintText: 'password'),
                                          obscureText: true,
                                          validator: (value) => value!.length < 6
                                              ? 'Enter a password of 6 or more characters'
                                              : null,
                                          onChanged: (val) {
                                            setState(() => password = val);
                                          },
                                        ),
                                        SizedBox(height: 20.0),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(25, 25,25, 0),
                                          width: double.infinity,
                                          child: RaisedButton(
                                              padding: EdgeInsets.all(15),
                                              color: Colors.deepPurple,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12)),
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(fontFamily: 'Mochiy Pop P One',color: Colors.white,fontSize: 18),
                                              ),
                                              onPressed: ()
                                              async {
                                                if (_formKey.currentState!.validate()) {
                                                  //setState(() => loading = true);
                                                  dynamic result =
                                                      await _auth.signInWithEmailAndPassword(email:
                                                          email, password: password);
                                                  if (result == null) {
                                                    setState(() {
                                                      error = 'please supply a valid email';
                                                      loading = false;
                                                    });
                                                  } else
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => HomeScreen()),
                                                    );
                                                }
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) => HomeScreen()),
                                                // );
                                              }),
                                        ),
                                        Text(
                                          error,
                                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(width: 9,),
                                            Text("Don't have an account?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                                            TextButton(onPressed:() => Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Register()),
                                            ), child: Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                                              ,))
                                          ],
                                        ),

                                      ])),
                                ),
                              ),
                            ]));

  }
}
