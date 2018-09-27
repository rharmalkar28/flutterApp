import 'package:flutter/material.dart';
import 'package:first_app/common/staticData.dart';
import 'package:first_app/Controller/LoginCtl.dart';

class loginPg extends StatefulWidget {
  @override
  _loginForm createState() => _loginForm();
}

class _loginForm extends State<loginPg> {
  final userCtl = TextEditingController();
  final passwdCtl = TextEditingController();

  final userLogin = new LoginCtl();

  @override
  void initState() {
    super.initState();

    userCtl.addListener(_handleUserName);
    passwdCtl.addListener(_handlePasswd);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    userCtl.removeListener(_handleUserName);
    passwdCtl.removeListener(_handlePasswd);
    userCtl.dispose();
    passwdCtl.dispose();
    super.dispose();
  }

  _handleUserName() {
    print("Second text field: ${userCtl.text}");
  }

  _handlePasswd() {
    print("Second text field: ${passwdCtl.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(),
      ),
    );
  }

  loginBody() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[loginHeader(), loginFields()],
      );

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlutterLogo(
            colors: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Welcome To ${staticData.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter username",
                  labelText: "Username",
                ),
                controller: userCtl,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                ),
                controller: passwdCtl,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  userLogin.logInUser(context, userCtl.text, passwdCtl.text);
                },
              ),
            ),
          ],
        ),
      );
}
