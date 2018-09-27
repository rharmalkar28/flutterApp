import 'package:flutter/material.dart';
import 'package:first_app/common/staticData.dart';

class CustomFloat extends StatelessWidget {
  final IconData icon;
  final Widget builder;
  final VoidCallback cfCallback;
  final isMini;

  CustomFloat({this.icon, this.builder, this.cfCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: isMini,
      onPressed: cfCallback,
      child: Ink(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: staticData.appGradients)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            builder != null
                ? Positioned(
                    right: 7.0,
                    top: 7.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: builder,
                      radius: 10.0,
                    ),
                  )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}
