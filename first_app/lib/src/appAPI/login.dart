import 'package:io/io.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class login {
  final String test = "string";
  
  varifyLogin(String userName, String passwd) {
    print("method varify login 123 ${userName} ${passwd} ${Firestore.instance.collection('subscribers').getDocuments().toString()}");
    //return "ok";
  }
}
