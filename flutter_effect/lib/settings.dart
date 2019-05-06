import 'package:flutter/material.dart';
import 'package:flutter_effect/global_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "Settings",
      body: SettingsForm(),
    );
  }
}

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final GlobalKey<FormState> _settingsFormKey = GlobalKey<FormState>();
  final userDisplayController = TextEditingController();
  final userNameController = TextEditingController();

  final mySnackBar =
      SnackBar(content: Text("Updating . . ."), duration: Duration(seconds: 2));

  String _userDisplayName = "";
  String _name = "";

  @override
  void dispose() {
    userDisplayController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _settingsFormKey,
        child: ListView(
          children: [
            new TextFormField(
              key: Key("displayName"),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter display name",
                hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Roboto'),
                prefixIcon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              textAlign: TextAlign.center,
//              validator: (value) => value.isEmpty ? "Needs Input" : null,
              controller: userDisplayController,
              onSaved: (value) => _userDisplayName = value,
            ),
            IconButton(
              key: Key("displayName"),
              icon: Icon(Icons.save),
              onPressed: () {
                if (_settingsFormKey.currentState.validate()) {
                  if (userDisplayController.text != "") {
                    Scaffold.of(context).showSnackBar(mySnackBar);

                    setState(() {
                      _userDisplayName = userDisplayController.text;
                    });

                    userDisplayController.text = "";

                    Firestore.instance.runTransaction((transaction) async {
                      DocumentSnapshot freshSnap = await Firestore.instance
                          .collection("username")
                          .document("3zqigfRFGwW3gSCEgeME")
                          .get();
                      await transaction.update(freshSnap.reference, {
                        "username": _userDisplayName,
                      });
                    });
                  }
                }
              },
            ),
            new TextFormField(
              key: Key("userName"),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter full name",
                hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Roboto'),
                prefixIcon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              textAlign: TextAlign.center,
//              validator: (nameValue) => nameValue.isEmpty ? "Needs Input" : null,
              controller: userNameController,
              onSaved: (nameValue) => _name = nameValue,
            ),
            IconButton(
              key: Key("name"),
              icon: Icon(Icons.save),
              onPressed: () {
                if (_settingsFormKey.currentState.validate()) {
                  if (userNameController.text != "") {
                    Scaffold.of(context).showSnackBar(mySnackBar);

                    setState(() {
                      _name = userNameController.text;
                    });

                    userNameController.text = "";

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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
