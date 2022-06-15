import 'package:task/screens/home/todo.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/home/profilelist.dart';
import 'package:task/services/auth.dart';
import 'package:task/shared/loading.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final AuthService _auth = AuthService();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Colors.teal,
        appBar: AppBar(
            title: Text("Codemates",style: TextStyle(color: Color.fromRGBO(92, 104, 211, .5),),),backgroundColor: Colors.white,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person,color: Color.fromRGBO(92, 104, 211, .5)),
              label: Text('logout',style: TextStyle(color: Color.fromRGBO(92, 104, 211, .5)),),
              onPressed: () async {
                await _auth.signOut();
              },
            ),]),
      body: ProfileList(),
    );
  }
}
