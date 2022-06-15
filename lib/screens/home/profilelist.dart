import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/models/profile.dart';
import 'package:task/screens/home/profileTile.dart';
import 'package:task/models/user.dart';
import 'package:task/shared/loading.dart';
class ProfileList extends StatefulWidget {

  //int c=0;
  //ProfileList({required this.c});

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
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
    return loading? Loading():Scaffold(
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
                    final profile = List<Profile>.generate(c, (i) => Profile(name: profileName[i], cc_rank: profilecc[i],he_rank: profileherank[i], apk_points: profileapk[i], interests: profileinterests[i] , pno:profilepno[i]),);
                    return ListView.builder(
                      itemCount: profile.length,
                      itemBuilder: (context, index) {
                        return profileTile(profile: profile[index],ind:index);},
                    );

                  }}
            )));
  }
}