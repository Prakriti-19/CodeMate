import 'package:task/screens/home/profileview.dart';
import 'package:flutter/material.dart';
import 'package:task/models/profile.dart';

class profileTile extends StatefulWidget {

  final Profile profile;
  int ind;
  profileTile({required this.profile, required this.ind});

  @override
  State<profileTile> createState() => _profileTileState();
}

class _profileTileState extends State<profileTile> {
  Tween<Offset> _offset =Tween(begin : Offset (1, 0), end: Offset (0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 200),
        child: Padding(
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
                  Container(
                    width: 195,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                        children:<Widget>[
                      SizedBox(
                        height: 20,
                      ),
                     Text(
                        widget.profile.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                     Text(
                        'Interests: ${widget.profile.interests} ',
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                  ),

                       Container(
                         width: 80,
                         child: RaisedButton(
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
                                                prof(profile: widget.profile, ind: widget.ind)),
                                      ),
                         ),
                       ),
                     ],
                   ),
              )]),
              ),

    );
  }
}
