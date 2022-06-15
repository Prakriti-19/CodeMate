import 'package:flutter/material.dart';
import 'package:task/models/user.dart';
import 'package:task/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/home/home.dart';
import 'package:task/screens/home/welcome.dart';
class wrapper extends StatelessWidget {
  //const wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    if( user==null){
      return Welcome(); //not signed in->welcome->login/sign in
    }
    else{
      return home();//call home screen
    }
  }
}
