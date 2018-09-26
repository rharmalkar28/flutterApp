import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login {
  final String test = "string";
  final FirebaseAuth auth = FirebaseAuth.instance;

  varifyLogin(String userName, String passwd) {

    handleSignInEmail(userName.toString().trim(), passwd.toString().trim());
    print("method varify login 123 $userName $passwd ${Firestore.instance.collection('subscribers').getDocuments().toString()}");
    //return "ok";
  }

  Future<FirebaseUser> handleSignInEmail(String email, String password) async {

    final FirebaseUser user = await auth.signInWithEmailAndPassword(email: email, password: password).catchError((onError)=>print("Login failed"));

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;

  }
}
