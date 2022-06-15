import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/models/user.dart';
import '../../models/profile.dart';
import '../../services/database.dart';
// class UserData<T> {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final String collection;
//
//   UserData({ required this.collection });
//
//
//   Stream<T> get documentStream {
//
//     return _auth.authStateChanges().switchMap((user) {
//       if (user != null) {
//         doc<T> doc = Document<T>(path: '$collection/${user.uid}');
//         return doc.streamData();
//       } else {
//         return Stream<T>.value(null);
//       }
//     });
//   }
//
//   Future<T> getDocument() async {
//     User user = await _auth.currentUser!;
//
//     if (user != null) {
//       Document doc = Document<T>(path: '$collection/${user.uid}');
//       return doc.getData();
//     } else {
//       return null;
//     }
//
//   }
//
//   Future<void> upsert(Map data) async {
//     FirebaseUser user = await _auth.currentUser();
//     Document<T> ref = Document(path:  '$collection/${user.uid}');
//     return ref.upsert(data);
//   }
//
// }
//}
class ProfilePage extends StatefulWidget {


  final User user;
  const ProfilePage({required this.user, });
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List a = _currentUser.providerData;
    //UserData userRecord = FirebaseAuth.instance.getUser(_currentUser.uid);
    // final CollectionReference _userCollection =
    // FirebaseFirestore.instance.collection('users');
    //ss
    // Future getUser(String uid) async {
    //   return await _userCollection.doc(uid).snapshots().map((doc) {
    //     _userDataFromSnapshot(doc);
    //   });
    // }
    // userData from snapshot
    UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
      return UserData(
        uid: _currentUser.uid,
         pno: '', he_rank: 0, apk_points: 0, cc_rank: '', name: '', interests: '',
      );


    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NAME: ${_currentUser.uid}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Text(
              'EMAIL: $a',
              style: Theme.of(context).textTheme.bodyText1,
            ),


            // Add widgets for verifying email
            // and, signing out the user
          ],
        ),
      ),
    );
  }
}

