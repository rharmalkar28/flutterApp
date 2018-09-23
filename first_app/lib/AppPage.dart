import 'package:flutter/material.dart';
import 'package:first_app/common/staticData.dart';
import 'package:first_app/uiComponents/loginPg.dart';

class AppPage extends StatelessWidget{
  final materialApp = MaterialApp(
    title: staticData.appName,
    theme: ThemeData(
      primaryColor: Colors.black,
      primarySwatch: Colors.amber
    ),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: loginPg(),
  );
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}