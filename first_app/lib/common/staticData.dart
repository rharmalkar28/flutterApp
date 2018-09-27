import 'package:flutter/material.dart';
class staticData {
  static const String appName = "Cable Orperator";

  //routes
  static const String home = "/home";
  static const String plans = "/plans";
  static const String transections = "/transections";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String coming_soon = "Coming Soon";

  //colors
  static List<Color> appGradients = [
    Colors.blueGrey.shade800,
    Colors.black87,
  ];

  //images
  static const String imageDir = "assets/imgs";
  static const String profileImage = "$imageDir/profile.jpg";
}
