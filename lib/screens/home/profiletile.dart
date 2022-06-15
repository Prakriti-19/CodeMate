import 'package:task/screens/home/profileview.dart';
import 'package:flutter/material.dart';
import 'package:task/models/profile.dart';

class profileTile extends StatelessWidget {
  //const profileTile({Key? key}) : super(key: key);
  final Profile profile;
  int ind;
  profileTile({required this.profile, required this.ind});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Stack(children: <Widget>[
          Container(
            height: 90,
            color: Colors.white38,
            child: Row(children: <Widget>[
              SizedBox(
                width: 6,
              ),
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('images/user.png'),
              ),

              SizedBox(
                width: 10,
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,

                  children:<Widget>[
                SizedBox(
                  height: 20,
                ),
               Text(
                  profile.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                ),
                SizedBox(
                  height: 4,
                ),
               Text(
                  'Interests: ${profile.interests} ',
                  style: TextStyle(fontSize: 15),
                ),
              ]),
               Row(
                 mainAxisSize: MainAxisSize.max ,

                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   // SizedBox(
                   //   height: 22,
                   // ),
                   RaisedButton(
                       hoverElevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: Colors.white,
                            child: Text(
                              'View',
                              style:
                                  TextStyle(color: Color.fromRGBO(92, 104, 211, .5)),
                            ),
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          prof(profile: profile, ind: ind)),
                                ),
                   ),
                 ],
               ),
            ]),
          )
        ]));
  }
}
