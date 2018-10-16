import 'package:flutter/material.dart';
import 'package:first_app/src/networkAPI/NTsubscriber.dart';

class SubsProvider extends InheritedWidget {
  SubsProvider({Key key, Widget child, this.NTsubscriber})
      : super(key: key, child: child);
  final baseNTsubscriber NTsubscriber;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SubsProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SubsProvider) as SubsProvider);
  }
}
