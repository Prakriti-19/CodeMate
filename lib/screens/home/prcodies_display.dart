import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/home/profiletile.dart';
import '../../models/profile.dart';
import '../../models/user.dart';
import 'not_found.dart';

class p_display extends StatefulWidget {
  String interests;
  p_display({required this.interests});

  @override
  _p_displayState createState() => _p_displayState();
}

class _p_displayState extends State<p_display> {

  @override
  List<String> profileName= [];
  List<String> profilecc=[];
  List<int> profileherank=[];
  List<int> profileapk=[];
  List<String> profileinterests=[];
  List<String> profilepno=[];
  List<String> profileg=[];

  int c=0;
  Widget build(BuildContext context) {
    c=0;
    print('entered build');
    print(c);
    String interests=widget.interests;

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('profile').snapshots();
    _usersStream.forEach((profile){
     profile.docs.asMap().forEach((index,data){
       if ((profile.docs[index]['interests']).toString().trim()==(interests).toString().trim())
       {
         profileName.add(profile.docs[index]['name']);
       }
     });
   });
   _usersStream.forEach((profile){
     profile.docs.asMap().forEach((index,data){
       if ((profile.docs[index]['interests']).toString().trim()==(interests).toString().trim()) {
         profilecc.add(profile.docs[index]['cc_rank']);
       }
     });
   });
   _usersStream.forEach((profile){
     profile.docs.asMap().forEach((index,data){
       if ((profile.docs[index]['interests']).toString().trim()==(interests).toString().trim()){
         profileherank.add(profile.docs[index]['he_rank']);
       }
     });
   });
   _usersStream.forEach((profile){
     profile.docs.asMap().forEach((index,data){
  if ((profile.docs[index]['interests']).toString().trim()==(interests).toString().trim()){
         profileapk.add(profile.docs[index]['apk_points']);
       }
     });
   });
   _usersStream.forEach((profile){
     profile.docs.asMap().forEach((index,data){
       if ((profile.docs[index]['interests']).toString().trim()==(interests).toString().trim()){
       profileinterests.add(profile.docs[index]['interests']);
       }
     });
   });
    _usersStream.forEach((profile){
      profile.docs.asMap().forEach((index,data){
        if ((profile.docs[index]['interests']).toString().trim()==(interests).toString().trim()){
          profileg.add(profile.docs[index]['gender']);
        }
      });
    });
   _usersStream.forEach((profile){
     profile.docs.asMap().forEach((index,data){
       if ((profile.docs[index]['interests']).toString().trim()==(interests).toString().trim()) {
         profilepno.add(profile.docs[index]['pno']);
         c=c+1;
         print('update');
         print(c);
       }
     });
   });



    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
          ),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 20.0,
                bottom: 20.0
            ),
            child: new Text(
              'Techies in ${interests}',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ),
          decoration: new BoxDecoration(
            color: Color.fromRGBO(92, 104, 211, .5),
          ),
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width,
            130.0
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('profile').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){return Center(child: CircularProgressIndicator());}
            final documentSnapshotList = snapshot.data!.docs.where((element) => element['interests']==interests);
           // c = documentSnapshotList.length;
            print('enetered stream builder');
            print(c);
            if (!snapshot.hasData) {
              return Center(child: Text("snapshot has no data"));
            }
            else {
              if (c == 0) {
                return Flash();
              }
              else{
                final profile = List<Profile>.generate(c, (i) => Profile(gender: profileg[i],name: profileName[i], cc_rank: profilecc[i],he_rank: profileherank[i], apk_points: profileapk[i], interests: profileinterests[i] , pno:profilepno[i], uid: '', email: ''),);
                return ListView.builder(
                  itemCount: profile.length,
                  itemBuilder: (context, index) {
                    return profileTile(profile: profile[index],ind:index);},
                );
              }
            }}),
    );
  }
}