import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/screens/home/profilelist.dart';
import 'package:task/screens/home/userprofile.dart';
import '../screens/home/update.dart';
import '../services/auth.dart';

class mDrawer extends StatefulWidget {
  final User user;
  const mDrawer({
    required this.user,
  });
  @override
  State<mDrawer> createState() => _mDrawerState();
}

class _mDrawerState extends State<mDrawer> {
  late User _currentUser;
  final AuthService _auth = AuthService();
  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  List<String> profileName = [];
  List<String> profilecc = [];
  List<int> profileherank = [];
  List<int> profileapk = [];
  List<String> profileinterests = [];
  List<String> profilepno = [];
  List<String> profileuid = [];
  int c = 0;

  Drawer build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('profile')
        .doc(_currentUser.uid)
        .update({'uid': _currentUser.uid});
    int c = 0;
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('profile').snapshots();
    _usersStream.forEach((profile) {
      profile.docs.asMap().forEach((index, data) {
        if ((profile.docs[index]['uid']).toString() ==
            (_currentUser.uid).toString()) {
          profileName.add(profile.docs[index]['name']);
          print(profileName[0]);
        }
      });
    });
    _usersStream.forEach((profile) {
      profile.docs.asMap().forEach((index, data) {
        if ((profile.docs[index]['uid']).toString() ==
            (_currentUser.uid).toString()) {

          profileuid.add(profile.docs[index]['uid']);
          print(profileuid[0]);
        }
      });
    });
    _usersStream.forEach((profile) {
      profile.docs.asMap().forEach((index, data) {
        if ((profile.docs[index]['uid']).toString() ==
            (_currentUser.uid).toString()) {
          profilecc.add(profile.docs[index]['cc_rank']);
          print(profilecc[0]);
        }
      });
    });
    _usersStream.forEach((profile) {
      profile.docs.asMap().forEach((index, data) {
        if ((profile.docs[index]['uid']).toString() ==
            (_currentUser.uid).toString()) {
          profileherank.add(profile.docs[index]['he_rank']);
          print(profileherank[0]);
        }
      });
    });
    _usersStream.forEach((profile) {
      profile.docs.asMap().forEach((index, data) {
        if ((profile.docs[index]['uid']).toString() ==
            (_currentUser.uid).toString()) {
          profileapk.add(profile.docs[index]['apk_points']);
          print(profileapk[0]);
        }
      });
    });
    _usersStream.forEach((profile) {
      profile.docs.asMap().forEach((index, data) {
        if ((profile.docs[index]['uid']).toString() ==
            (_currentUser.uid).toString()) {
          profileinterests.add(profile.docs[index]['interests']);
          print(profileinterests[0]);
        }
      });
    });
    _usersStream.forEach((profile) {
      profile.docs.asMap().forEach((index, data) {
        if ((profile.docs[index]['uid']).toString() ==
            (_currentUser.uid).toString()) {
          profilepno.add(profile.docs[index]['pno']);
          print(profilepno[0]);
        }
      });
    });
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Colors.white,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('profile').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/welcome.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(''),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_rounded,
                  ),
                  title: const Text('My Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Userprof(interests: profileinterests[0], cc: profilecc[0], he: profileherank[0].toString(), apk: profileapk[0].toString(), name: profileName[0], pno: profilepno[0])),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.edit,
                  ),
                  title: const Text('Edit Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => update()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.chat,
                  ),
                  title: const Text('Chat'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => update()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.search,
                  ),
                  title: const Text('Search'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileList()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: const Text('Logout'),
                  onTap: () async  {
                     await _auth.signOut();
                  },
                ),
              ],
            );
            //}
            // }
          }),
    );
  }
}
