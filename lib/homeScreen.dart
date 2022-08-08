import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/home/prcodies_display.dart';
import 'package:task/screens/home/profilelist.dart';
import 'package:task/screens/home/update.dart';
import 'package:task/screens/utube/AppD.dart';
import 'package:task/screens/utube/WebD.dart';
import 'package:task/screens/utube/aiml.dart';
import 'package:task/screens/utube/blockchain.dart';
import 'package:task/screens/utube/design.dart';
import 'package:task/services/carousel.dart';
import 'package:task/videoplayer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:task/services/auth.dart';
import 'models/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser!;

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  String cat = "";
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final Shader _linearGradient = LinearGradient(
      colors: [
        Colors.lightBlueAccent,
        Colors.blue,
        Colors.indigo,
        Colors.deepPurple
      ],
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));

    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 57, 89, 1),
      drawer: mDrawer(
        user: user,
      ), //DrawerHeader
      body: Builder(
          builder: (context) => SingleChildScrollView(
                  child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 9.0),
                      Row(
                        children: [
                          IconButton(
                              icon: new Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer()),
                          SizedBox(
                            width: 260,
                          ),
                          IconButton(
                              icon: new Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => update()),
                                );
                              })
                        ],
                      ),

                      SizedBox(height: 4.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Container(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Color.fromRGBO(33, 57, 89, 1),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              p_display(interests: cat)));
                                },
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide.none), // OutlineInputBo
                              hintText: ' Search ',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(33, 57, 89, 1),
                                  fontSize: 17),
                            ),
                            onChanged: (val) {
                              setState(() => cat = val);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/hs.png"),
                                fit: BoxFit.fill),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(260, 45, 2, 10),
                            child: InkWell(
                                child: Text(
                                  'Check out now',
                                  style: TextStyle(
                                    fontFamily: 'Mochiy Pop P One',
                                    color: Colors.transparent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileList()),
                                  );
                                }),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
                        child: Text(
                          'Wings',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              //fontFamily: 'Mochiy Pop P One',
                              // foreground: Paint()..shader = _linearGradient,
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                          height: 50,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.lightBlue[100],
                                        textColor: Colors.indigo,
                                        child: Text(
                                          'AppD',
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AppD()));
                                        })),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.lightBlue[100],
                                        textColor: Colors.indigo,
                                        child: Text(
                                          'WebD',
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WebD()));
                                        })),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.lightBlue[100],
                                        textColor: Colors.indigo,
                                        child: Text(
                                          'AI/ML',
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Aiml()));
                                        })),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.lightBlue[100],
                                        textColor: Colors.indigo,
                                        child: Text(
                                          'Open Source',
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Blockchain()));
                                        })),
                                SizedBox(
                                  height: 20,
                                  width: 10,
                                ),
                                Container(
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.lightBlue[100],
                                        textColor: Colors.indigo,
                                        child: Text(
                                          'Design',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Design()));
                                        })),
                              ])),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Upcoming Contests',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              //fontFamily: 'Mochiy Pop P One',
                              //foreground: Paint()..shader = _linearGradient,
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 170,
                              child: Swiper(
                                viewportFraction: 1,
                                onIndexChanged: (index) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                autoplay: true,
                                layout: SwiperLayout.DEFAULT,
                                itemCount: carousels.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        //padding: EdgeInsets.fromLTRB(20, 130, 6, 6),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 130, 140, 6),
                                          decoration: BoxDecoration(
                                            //color: Colors.pink,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 5, 90, 10),
                                            child: InkWell(
                                                child: Center(
                                                  child: Text(
                                                    'Check out now',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Mochiy Pop P One',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  launch(linkData[index]);
                                                }),
                                          ),
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              carousels[index].image,
                                            ),
                                            fit: BoxFit.cover)),
                                  );
                                },
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(9, 8, 0, 0),
                        child: Text(
                          'New Recomendations',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              //fontFamily: 'Mochiy Pop P One',
                              //foreground: Paint()..shader = _linearGradient,
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          height: 185,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(
                                  height: 4,
                                  width: 6,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.fromLTRB(2, 7, 2, 17),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                        image: AssetImage("images/p.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 2, 10),
                                    child: InkWell(
                                        child: Text(
                                          'Check out now',
                                          style: TextStyle(
                                            fontFamily: 'Mochiy Pop P One',
                                            color: Colors.transparent,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 80,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Videopage(
                                                    cat:
                                                        'https://www.youtube.com/watch?v=1vsmaEfbnoE')),
                                          );
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(2, 2, 2, 7),
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                        image: AssetImage("images/h.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 2, 10),
                                    child: InkWell(
                                        child: Text(
                                          'Check out now',
                                          style: TextStyle(
                                            fontFamily: 'Mochiy Pop P One',
                                            color: Colors.transparent,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 80,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Videopage(
                                                    cat:
                                                        'https://www.youtube.com/watch?v=THp_EowtJ0M')),
                                          );
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                        image: AssetImage("images/f.png"),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 2, 10),
                                    child: InkWell(
                                        child: Text(
                                          'Check out now',
                                          style: TextStyle(
                                            fontFamily: 'Mochiy Pop P One',
                                            color: Colors.transparent,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 50,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Videopage(
                                                    cat:
                                                        'https://www.youtube.com/watch?v=d0wsoY6meBY')),
                                          );
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                  width: 6,
                                ),
                              ])),
                    ]),
              ))),
    );
  }
}
