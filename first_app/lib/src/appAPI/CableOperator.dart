import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/src/appAPI/SubscriberOperations.dart';
import 'package:first_app/src/model/LoginUser.dart';
import 'package:first_app/src/model/Subscriber.dart';
import 'package:first_app/src/appAPI/login.dart';

class CableOperator extends Model {
  LoginUser user;
  final userLogin = new login();
  List<Subscriber> subsList;
  final SubscriberOperations subscriberOperations = SubscriberOperations();
}

abstract class UserData extends CableOperator {
  void logInUser(BuildContext context, String email, String passwd) async {
    user = await userLogin.varifyLogin(email, passwd);
    print("user data ${user.uid}");
    if (user != null) {
      notifyListeners();
    } else {
      print("invalid user");
      notifyListeners();
    }
  }
}

abstract class SubscrberData extends CableOperator {
  void addSubscriber() {
    //subsList.add(subscriber);
    print("add Subscriiber click");
    notifyListeners();
  }
}

class MainApi extends Model with CableOperator, UserData, SubscrberData {}
