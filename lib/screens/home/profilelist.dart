import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/models/profile.dart';
import 'package:task/screens/home/profileTile.dart';
import 'package:task/models/user.dart';
import 'package:task/shared/loading.dart';
class ProfileList extends StatefulWidget {

  @override
  _ProfileListState createState() => _ProfileListState();
}
class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height-50);
    path.quadraticBezierTo(width/2, height, width, height-50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class _ProfileListState extends State<ProfileList> with SingleTickerProviderStateMixin{

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override


  int c = 0; bool loading=false;
  List<String> profileName= [];
  List<String> profilecc=[];
  List<int> profileherank=[];
  List<int> profileapk=[];
  List<String> profileinterests=[];
  List<String> profilepno=[];
  
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('profile').snapshots();
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profileName.add(profile.docs[index]['name']);
        print(profileName[index]);
      });
    });
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profilecc.add(profile.docs[index]['cc_rank']);
        print(profilecc[index]);
      });
    });
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profileherank.add(profile.docs[index]['he_rank']);
        print(profileherank[index]);
      });
    });
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profileapk.add(profile.docs[index]['apk_points']);
        print(profileapk[index]);
      });
    });
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profileinterests.add(profile.docs[index]['interests']);
        print(profileinterests[index]);
      });
    });
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        profilepno.add(profile.docs[index]['pno']);
        print(profilepno[index]);
      });
    });
    Tween<Offset> _offset =Tween(begin : Offset (1, 0), end: Offset (0, 0));

    return loading? Loading():Scaffold(
      appBar: AppBar(
        toolbarHeight: 105,
        backgroundColor: Color.fromRGBO(92, 104, 211, .5),
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 190,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(92, 104, 211, .5),
            child: Center(child: Text("Codies",style: TextStyle(fontSize: 28,color:  Colors.white,fontWeight: FontWeight.bold),)),
          ),
        ),),
        body:Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),

            child:StreamBuilder<QuerySnapshot>(
                stream:
                FirebaseFirestore.instance.collection('profile').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  print("entered stream builder");
                  final documentSnapshotList = snapshot.data!.docs;
                  c = documentSnapshotList!.length;
                  if (!snapshot.hasData) {
                    return Text('snapshot does not have data');
                  }
                  else {
                    final profile = List<Profile>.generate(c, (i) => Profile(name: profileName[i], cc_rank: profilecc[i],he_rank: profileherank[i], apk_points: profileapk[i], interests: profileinterests[i] , pno:profilepno[i], uid: ''),);
                    return AnimatedList(
                      key: _listKey,
                      initialItemCount: profile.length,
                      itemBuilder: (context, index,animation) {
                        return SlideTransition(
                        position: animation.drive(_offset),
                            child:profileTile(profile: profile[index],ind:index));},
                    );

                  }}
            )));
  }
}