import 'package:flutter/material.dart';
import 'package:task/homeScreen.dart';
import 'package:task/models/user.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/home/welcome.dart';
class wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    if( user==null){
      return Welcom(); //not signed in->welcome->login/sign in
    }
    else{
      return HomeScreen();//call home screen
    }
  }
}
