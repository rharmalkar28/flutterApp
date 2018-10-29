// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_app/src/model/LoginUser.dart';

// class login {
//   final String test = "string";
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   varifyLogin(String userName, String passwd) async {
//     final LoginUser user = await handleSignInEmail(
//         userName.toString().trim(), 
//         passwd.toString().trim()
//       );

//     print(
//         "method varify login 123 $userName $passwd ${Firestore.instance.collection('subscribers').getDocuments().toString()} $user");
//     //return "ok";
//     return user;
//   }

//   Future<LoginUser> handleSignInEmail(String email, String password) async {
//     final FirebaseUser user = await auth
//         .signInWithEmailAndPassword(email: email, password: password)
//         .catchError((onError) => print("Login failed $onError"));

//     if (user != null) {
//       LoginUser currentUsr = LoginUser(email: user.email, uid: user.uid);
//       return currentUsr;
//     }
//     return null;
//     // assert(user != null);
//     // assert(await user.getIdToken() != null);

//     // final FirebaseUser currentUser = await auth.currentUser();
//     // assert(user.uid == currentUser.uid);

//     // print('signInEmail $user');

//     // return user;
//   }
// }
