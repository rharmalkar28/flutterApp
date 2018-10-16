import 'package:flutter/material.dart';
import 'package:first_app/src/serviceAPI/AuthProvider.dart';
import 'package:first_app/uiComponents/loginPg.dart';
import 'package:first_app/uiComponents/SubsList.dart';
import 'package:first_app/src/serviceAPI/SubsProvider.dart';
import 'package:first_app/src/networkAPI/NTsubscriber.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus {
  isProcessing,
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.isProcessing;
  String currentUserId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var auth = AuthProvider.of(context).auth;
    auth.currentUser().then((userId) {
      if (userId != null) {
        currentUserId = userId;
      }
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.isProcessing:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        print("test signin $_signedIn");
        return loginPg(
          _signedIn,
        );
      case AuthStatus.signedIn:
        return SubsProvider(
          NTsubscriber: new NTsubscriber(currentUserId, null),
          child: SubsList(onSignedOut: _signedOut),
        );
      // return SubsList(
      //   onSignedOut: _signedOut,
      // );
    }
    return null;
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
