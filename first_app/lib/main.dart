import 'package:flutter/material.dart';
import 'package:first_app/AppPage.dart';
import './uiComponents/ComingSoon.dart';

void main() => runApp(MaterialApp(
    home: new AppPage(),
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => new ComingSoon(),
    },
  )
);