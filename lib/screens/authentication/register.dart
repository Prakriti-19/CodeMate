import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/services/auth.dart';
import 'package:task/screens/home/home.dart';
import 'package:task/screens/authentication/signin.dart';
import 'package:flutter/services.dart';
import 'package:task/screens/home/update.dart';
import 'package:task/shared/loading.dart';

/**
    class Register extends StatefulWidget {
    //const signIn({Key? key}) : super(key: key);
    @override
    _RegisterState createState() => _RegisterState();
    }

    class _RegisterState extends State<Register> {
    @override
    Widget buildEmail() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    'Email',
    style: TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),
    Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
    color: Colors.purple[50]
    ,
    borderRadius: BorderRadius.circular(16),
    ),
    height: 60,
    child: TextFormField(
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(color: Colors.black87),
    decoration: InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.only(top: 14),
    prefixIcon: Icon(Icons.email, color: Colors.purple[100]),
    hintText: 'Email',
    hintStyle: TextStyle(color: Colors.purple[100])),
    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
    onChanged: (val) {
    setState(() => email = val);
    }
    ),
    )
    ],
    );
    }

    Widget buildPassword() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    'Password',
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 5),
    Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
    color: Colors.purple[100],
    borderRadius: BorderRadius.circular(16),
    ),
    height: 60,
    child: TextFormField(
    obscureText: true,
    style: TextStyle(color: Colors.black87),
    decoration: InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.only(top: 14),
    prefixIcon: Icon(Icons.lock, color: Colors.purple[450]),
    hintText: 'Password',
    hintStyle: TextStyle(color: Colors.black38)),
    validator: (value) => value!.length < 6
    ? 'Enter a password of 6 or more characters'
    : null,
    onChanged: (val) {
    setState(() => password = val);
    },
    ),
    )
    ],
    );
    }

    Widget buildRegisterBtn() {
    return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
    elevation: 5,
    onPressed: () async {
    dynamic result =
    await _auth.registerWithEmailAndPassword(email, password);
    if (result == null) {
    setState(() {
    error = 'could not register';
    loading = false;
    });
    }

    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => update()),
    );
    },
    padding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.purple[400],
    child: Text(
    'REGISTER',
    style: TextStyle(
    color: Colors.white38,
    fontSize: 22,
    fontWeight: FontWeight.bold),
    ),
    ),
    );
    }

    @override
    final AuthService _auth = AuthService();
    String email = '';
    String password = '';
    String error = '';
    bool loading = false;
    final _formKey = GlobalKey<FormState>();
    Widget build(BuildContext context) {
    return loading
    ? Loading()
    : Scaffold(
    body: //AnnotatedRegion<SystemUiOverlayStyle>(
    //value: SystemUiOverlayStyle.light,
    //child: GestureDetector(
    //child:
    Stack(children: <Widget>[
    Container(
    // height: double.infinity,
    // width: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/login.png"),
    fit: BoxFit.cover,
    ),
    ),
    child: SingleChildScrollView(
    physics: AlwaysScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(
    horizontal: 25,
    //vertical: 80,
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Center(
    child: CircleAvatar(
    radius: 50.0,
    backgroundColor:
    Colors.white24
    .withOpacity(
    0.5,
    ),
    child: const Icon(
    Icons.person,
    color: Colors.white,
    size: 40,
    ))),
    SizedBox(height: 90),
    buildEmail(),
    SizedBox(height: 10),
    buildPassword(),
    SizedBox(height: 80),
    buildRegisterBtn(),
    ],
    ),
    ),
    )
    ]),
    );
    }
    }**/
class Register extends StatefulWidget {
  // final Function toggleView;
  // Register({required this.toggleView});
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
            appBar: AppBar(
                backgroundColor: Color.fromRGBO(92, 104, 211, .8),
                title: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signIn()),
                      );
                      //widget.toggleView();
                    },
                  ),
                ]),
            body: Stack(children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/login.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        Center(
                            child: CircleAvatar(
                                radius: 45.0,
                                backgroundColor: Colors.white24.withOpacity(
                                  0.3,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 38,
                                ))),
                        SizedBox(height: 70.0),
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
                        RaisedButton(
                            color: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
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

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => update()),
                        // );

                        //   onPressed: () async {
                        //     if (_formKey.currentState!.validate()) {
                        //       setState(() {
                        //         loading = true;
                        //       });
                        //       try {
                        //        dynamic result= await _auth.registerWithEmailAndPassword(
                        //             email, password);
                        //         Navigator.of(context).pop();
                        //         setState(() {
                        //           loading = false;
                        //         });
                        //       } on FirebaseAuthException catch (e) {
                        //         showDialog(
                        //           context: context,
                        //           builder: (ctx) => AlertDialog(
                        //             title: Text(' Ops! Registration Failed'),
                        //             content: Text('${e.message}'),
                        //             actions: [
                        //               TextButton(
                        //                 onPressed: () {
                        //                   Navigator.of(ctx).pop();
                        //                 },
                        //                 child: Text('Okay'),
                        //               )
                        //             ],
                        //           ),
                        //         );
                        //       }
                        //       setState(() {
                        //         loading = false;
                        //       });
                        //     }
                        //   },

                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ])))
            ]));
  }
}
