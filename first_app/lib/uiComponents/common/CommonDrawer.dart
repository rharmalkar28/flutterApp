import 'package:flutter/material.dart';
import 'package:first_app/common/staticData.dart';
import 'package:first_app/src/serviceAPI/AuthProvider.dart';

class CommonDrawer extends StatelessWidget {
  
  CommonDrawer({this.onSignedOut, this.mainContext});
  final VoidCallback onSignedOut;
  final BuildContext mainContext;

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Rahul Harmalkar",
            ),
            accountEmail: Text(
              "rharmalkar28@gmail.com",
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage(staticData.profileImage), //
            ),
          ),
          new ListTile(
            title: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          new ListTile(
            title: Text(
              "Subscribers",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.green,
            ),
          ),
          new ListTile(
            title: Text(
              "Dashboard",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
          ),
          new ListTile(
            title: Text(
              "Plans",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.timeline,
              color: Colors.cyan,
            ),
            onTap: () {Navigator.pushNamed(mainContext, '/a');},
          ),
          Divider(),
          new ListTile(
            title: Text(
              "log out",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
            onTap: () {_signOut(context);},
          ),
          Divider(),
          //MyAboutTile()
        ],
      ),
    );
  }
}
