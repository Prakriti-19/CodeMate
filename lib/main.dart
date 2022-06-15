import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task/main2.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
    await Future.delayed(Duration(seconds:2), () {});
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
                    //Image.network('https://ibb.co/CMBgCyf'),
                    Padding(padding: EdgeInsets.only(top:60.0,bottom: 20.0)),
                    Image(image: AssetImage('images/splash_Screen.png')),
                  ],
                ),
              ),
              Expanded(flex:1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(color: Color.fromRGBO(171,105,180,1)),
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