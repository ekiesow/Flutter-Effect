import 'package:flutter/material.dart';

import 'package:flutter_effect/Auth/auth.dart';
import 'package:flutter_effect/Auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class NameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Name can\'t be empty' : null;
  }
}

class UserNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Name can\'t be empty' : null;
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _name;
  String _username;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final BaseAuth auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          final String userId =
          await auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          _setCloudStateName();
          _setCloudStateUserName();
          await FirebaseAuth.instance.sendSignInWithEmailLink(
            email: _email,
            url: "https://fluttereffect.page.link/tc4X",
            handleCodeInApp: true,
            iOSBundleID: "edu.csuchico.flutter_effect",
            androidPackageName: "edu.csuchico.flutter_effect",
            androidInstallIfNotAvailable: true,
            androidMinimumVersion: "12",
          );
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  Future<void> validateAndSubmit2() async {
    if (validateAndSave()) {
      final BaseAuth auth = AuthProvider.of(context).auth;
      try {
        _setCloudStateName();
        _setCloudStateUserName();
        _setCloudStateEmail();
        final String userId =
        await auth.createUserWithEmailAndPassword(_email, _password);
        await FirebaseAuth.instance.sendSignInWithEmailLink();
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
  Widget build(BuildContext context) {
    if (_formType == FormType.login) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Flutter Effect')),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: buildInputsLogin(),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Flutter Effect')),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: buildInputsRegister(),
          ),
        ),
      );
    }
  }

  buildInputsLogin() {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      TextFormField(
        key: Key('email'),
        decoration: InputDecoration(labelText: 'Email'),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) => _email = value,
        keyboardType: TextInputType.emailAddress,
      ),
      TextFormField(
        key: Key('password'),
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) => _password = value,
      ),
      RaisedButton(
        key: Key('signIn'),
        child: Text('Login', style: TextStyle(fontSize: 20.0)),
        onPressed: validateAndSubmit,
      ),
      FlatButton(
        child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
        onPressed: moveToRegister,
      ),
    ]);
  }

  buildInputsRegister() {
    return ListView(
//        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[
          TextFormField(
            key: Key('name'),
            decoration: InputDecoration(labelText: 'Name'),
            validator: NameFieldValidator.validate,
            onSaved: (String value) => _name = value,
            //keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            key: Key('username'),
            decoration: InputDecoration(labelText: 'Username'),
            validator: UserNameFieldValidator.validate,
            onSaved: (String value) => _username = value,
            //keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            key: Key('email'),
            decoration: InputDecoration(labelText: 'Email'),
            validator: EmailFieldValidator.validate,
            onSaved: (String value) => _email = value,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            key: Key('password'),
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: PasswordFieldValidator.validate,
            onSaved: (String value) => _password = value,
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 12.0),
          ),
//          RaisedButton(
//            child:
//            Text('Create an account(verify)', style: TextStyle(fontSize: 20.0)),
//            onPressed: validateAndSubmit,
//          ),
          RaisedButton(
            child:
            Text('Create an account', style: TextStyle(fontSize: 20.0)),
            onPressed: validateAndSubmit2,
          ),
          FlatButton(
            child: Text('Have an account? Login',
                style: TextStyle(fontSize: 20.0)),
            onPressed: moveToLogin,
          ),
        ]);
  }

  _setCloudStateName() async {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await Firestore.instance
          .collection("name")
          .document("VvqgGrzToXRYvqRqAYDp")
          .get();
      await transaction.update(freshSnap.reference, {
        "name": _name,
      });
    });
  }

  _setCloudStateUserName() async {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await Firestore.instance
          .collection("username")
          .document("3zqigfRFGwW3gSCEgeME")
          .get();
      await transaction.update(freshSnap.reference, {
        "username": _username,
      });
    });
  }
  _setCloudStateEmail() async {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await Firestore.instance
          .collection("email")
          .document("nYa62ZVHCFayRavfNuNn")
          .get();
      await transaction.update(freshSnap.reference, {
        "email": _email,
      });
    });
  }
}
