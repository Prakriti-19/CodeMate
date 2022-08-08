import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/services/auth.dart';
//import 'package:task/screens/home/home.dart';
import 'package:task/screens/authentication/signin.dart';
import 'package:flutter/services.dart';
import 'package:task/screens/home/update.dart';
import 'package:task/shared/loading.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
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
        body: Stack(
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
    color: Colors.transparent,
        padding:
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
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
                            'Register',
                            style: TextStyle(fontSize: 18,
                                fontFamily: 'Mochiy Pop P One',
                                color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'please supply a valid email';
                                  loading = false;
                                });
                              } else
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => update()),
                                );
                            }
                          }),
                    ),
                    Text(
                      error,

                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 8,),
                        Text("Already have an account?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                        TextButton(onPressed:() => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signIn()),
                        ), child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                          ,))
                      ],
                    ),
                  ])))
    )]));
  }
}
