import 'package:flutter/material.dart';
import 'package:first_app/common/staticData.dart';
import 'package:first_app/uiComponents/RootPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/src/serviceAPI/AuthProvider.dart';
import 'package:first_app/src/model/LoginUser.dart';
import 'package:first_app/src/networkAPI/auth.dart';
//import 'package:first_app/uiComponents/SubsList.dart';

class AppPage extends StatelessWidget{
  final materialApp = MaterialApp(
    title: staticData.appName,
    theme: ThemeData(
      primaryColor: Colors.black,
      primarySwatch: Colors.amber
    ),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: RootPage(),
  );
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
        auth: new Auth(),
        child: materialApp
        );
  }
}