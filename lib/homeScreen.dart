//update
//profile
//chat
//to-do
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/home/update.dart';
import 'package:task/screens/home/userprofile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:task/services/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  String cat = '';
  @override
  Widget build(BuildContext context) {
    final Shader _linearGradient = LinearGradient(
      colors: [Colors.purpleAccent, Colors.indigo],
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
            'Heyy, What Are You \nLooking For?',
            style: TextStyle(
                foreground: Paint()..shader = _linearGradient,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          )),
                  Container(
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color:Colors.purple[700],
                            ),
                            onPressed: () {}),
                        fillColor: Colors.deepPurple[100],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none), // OutlineInputBo
                        hintText: '   Search ',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      onChanged: (val) {
                        setState(() => cat = val);
                      },
                    ),
                  ),
                  SizedBox(height: 18),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child:Text(
                    'Categories',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        foreground: Paint()..shader = _linearGradient, fontSize: 21, fontWeight: FontWeight.bold),
                  ),),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                      height: 50,
                      child:
                      ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                        Container(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                                color: Colors.purpleAccent[100],
                                textColor: Colors.purple[700],
                                child: Text(
                                  'AppD',
                                ),
                                onPressed: () {})),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                                color: Colors.purpleAccent[100],
                                textColor: Colors.purple[700],
                                child: Text(
                                  'WebD',
                                ),
                                onPressed: () {
                                  //Navigator.push(
                                  // context, MaterialPageRoute(builder: (context) => p_display(cat: 'books')));
                                })),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
                                color: Colors.purpleAccent[100],
                                textColor: Colors.purple[700],
                                child: Text(
                                  'AI/ML',
                                ),
                                onPressed: () {})),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: FlatButton(
                                color: Colors.purpleAccent[100],
                                textColor: Colors.purple[700],
                                child: Text(
                                  'Blockchain',
                                ),
                                onPressed: () {})),
                        SizedBox(
                          height: 20,
                          width: 10,
                        ),
                        Container(
                            child: FlatButton(
                                color: Colors.purpleAccent[100],
                                textColor: Colors.purple[700],
                                child: Text(
                                  'Design',
                                ),
                                onPressed: () {})),
                      ])),
                  SizedBox(
                    height: 17,
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child:Text(
                      'Upcoming Contests',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          foreground: Paint()..shader = _linearGradient, fontSize: 21, fontWeight: FontWeight.bold),
                    ),),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.0,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/codechef.png'),
                                fit: BoxFit.fitWidth)),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.0,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/codeforces.png'),
                                fit: BoxFit.fitWidth)),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width / 5, 0.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.0,
                            height: MediaQuery.of(context).size.height / 6,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/hackerearth.png'),
                                    fit: BoxFit.fitWidth)),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.0,
                        //height: MediaQuery.of(context).size.height / 4,
                        child: new InkWell(
                            child: new Text('Check out now',style: TextStyle(foreground: Paint()..shader = _linearGradient, fontSize: 11,),),
                            onTap: () => launch(
                                'https://www.codechef.com/contests?itm_medium=navmenu&itm_campaign=allcontests')),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.0,
                        //height: MediaQuery.of(context).size.height / 4,
                        child: new InkWell(
                            child: new Text('Check out now',style: TextStyle(foreground: Paint()..shader = _linearGradient, fontSize: 11,),),
                            onTap: () => launch(
                                'https://codeforces.com/contests')),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width / 6.5, 10.0, 0.0, 0.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.0,
                        //height: MediaQuery.of(context).size.height / 4,
                        child: new InkWell(
                            child: new Text('Check out now',style: TextStyle(foreground: Paint()..shader = _linearGradient, fontSize: 11, ),),
                            onTap: () =>
                                launch('https://www.hackerearth.com/challenges/')),
                      ),
                    ],
                  ),

          SizedBox(height: 10.0),
          RaisedButton(
              color: Color.fromRGBO(0, 29, 30, 11.8),
              onPressed: () {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        user: user,
                      ),
                    ),
                  );
                }
              }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child:Text(
                      'New Recomendations',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          foreground: Paint()..shader = _linearGradient, fontSize: 21, fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(
                    height: 10,
                  ),

          Container(
              height: 125,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                SizedBox(
                  height: 4,
                  width: 8,
                ),
                Container(
                  width: 150,
                  padding: EdgeInsets.fromLTRB(2, 7, 2, 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("images/b.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                  width: 14,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(2, 2, 2, 7),
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("images/a.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                  width: 14,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("images/x.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                  width: 8,
                ),
              ])),

          SizedBox(
            height: 17,
          ),

          Text(
            'You May Also Like',
            style: TextStyle(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 16,
          ),

          Container(
              height: 185,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                SizedBox(
                  height: 4,
                  width: 6,
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(2, 7, 2, 17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage("images/p.png"), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 4,
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(2, 2, 2, 7),
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage("images/h.png"), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 4,
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage("images/f.png"), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 4,
                  width: 6,
                ),
              ])),
        ])),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 0,
          child: Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                              minWidth: 40,
                              onPressed: () {},
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.home_outlined),
                                    Text('HOME',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ))
                                  ])),
                          SizedBox(
                            width: 40,
                          ),
                          MaterialButton(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    Text('Update',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ))
                                  ]),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>update()),);
                              }),
                          SizedBox(
                            width: 40,
                          ),
                          FlatButton.icon(
                            icon: Icon(Icons.person,color: Color.fromRGBO(92, 104, 211, .5)),
                            label: Text('logout',style: TextStyle(color: Color.fromRGBO(92, 104, 211, .5)),),
                            onPressed: () async {
                              await _auth.signOut();
                            },
                          ),
                        ])
                  ])),
        ));
  }
}
