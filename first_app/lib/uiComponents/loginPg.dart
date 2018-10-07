import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/common/staticData.dart';
import 'package:first_app/Controller/LoginCtl.dart';
import 'package:first_app/src/appAPI/CableOperator.dart';
import 'package:first_app/uiComponents/SubsList.dart';
import 'package:first_app/src/serviceAPI/AuthProvider.dart';

// https://github.com/bizz84/coding-with-flutter-login-demo/blob/master/lib/login_page.dart
// scheduleMicrotask

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class loginPg extends StatefulWidget {
  final VoidCallback onSignedIn;
  loginPg(this.onSignedIn);

  @override
  State<StatefulWidget> createState() => _LoginForm();
}

enum FormType {
  login,
  register,
}

class _LoginForm extends State<loginPg> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  final userCtl = TextEditingController();
  final passwdCtl = TextEditingController();
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        var auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          String userId = await auth.signInWithEmailAndPassword(
              _email, _password);
          print('Signed in: $userId $widget ${widget.onSignedIn}');
        } else {
          String userId = await auth.createUserWithEmailAndPassword(
              _email, _password);
          print('Registered user: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  void initState() {
    super.initState();

    userCtl.addListener(_handleUserName);
    passwdCtl.addListener(_handlePasswd);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    userCtl.removeListener(_handleUserName);
    passwdCtl.removeListener(_handlePasswd);
    userCtl.dispose();
    passwdCtl.dispose();
    super.dispose();
  }

  _handleUserName() {
    print("Second text field: ${userCtl.text}");
  }

  _handlePasswd() {
    print("Second text field: ${passwdCtl.text}");
  }

  // _openSubsList(context) {
  //   return Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SubsList()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(),
      ),
    );
  }

  loginBody() => Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[loginHeader(), loginFields()],
      ));

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlutterLogo(
            colors: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Welcome To ${staticData.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                key: Key('email'),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter username",
                  labelText: "Username",
                ),
                validator: EmailFieldValidator.validate,
                onSaved: (value) => _email = value,
                //controller: userCtl,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextFormField(
                key: Key('password'),
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                ),
                validator: PasswordFieldValidator.validate,
                onSaved: (value) => _password = value,
                // controller: passwdCtl,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                width: double.infinity,
                child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    shape: StadiumBorder(),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    onPressed: validateAndSubmit,
                    // onPressed: () {
                    //   model.logInUser(context, userCtl.text, passwdCtl.text);
                    // },
                  ),
                ),
          ],
        ),
      );
}
