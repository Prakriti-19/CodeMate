// @dart=2.9
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/main2.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      themeMode: ThemeMode. dark,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.latoTextTheme()
      ),
      darkTheme: ThemeData(
      brightness: Brightness.dark,
      ),
    home: SplashScreen(),
  ));
}
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigationtohome();
  }
  _navigationtohome()async{
    await Future.delayed(Duration(seconds:5), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>Homepage()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              color: Color.fromRGBO(33, 57, 89, 1)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top:60.0,bottom: 20.0)),
                    Image(image: AssetImage('images/splash_Screen.png')),
                  ],
                ),
              ),
              Expanded(flex:1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SpinKitRotatingCircle(color: Color.fromRGBO(171,105,180,1)),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                      ]
                  ))
            ],
          )
        ],
      ),
    );
  }
}