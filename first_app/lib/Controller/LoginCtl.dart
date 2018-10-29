// import 'package:flutter/material.dart';
// import 'package:first_app/src/appAPI/login.dart';
// import 'package:first_app/src/model/LoginUser.dart';
// import 'package:first_app/uiComponents/SubsList.dart';

// class LoginCtl {
//   final userLogin = new login();

//   logInUser(BuildContext context, String email, String passwd) async {
//     LoginUser user = await userLogin.varifyLogin(email, passwd);
//     if (user != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SubsList()),
//       );
//     }else{
//       print("invalid user");
//     }

//     // Navigator.push returns a Future that will complete after we call
//     // Navigator.pop on the Selection Screen!
//     // final result = await Navigator.push(
//     //   context,
//     //   // We'll create the SelectionScreen in the next step!
//     //   MaterialPageRoute(builder: (context) => SelectionScreen()),
//     // );
//   }
// }
