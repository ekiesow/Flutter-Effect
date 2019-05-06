import 'package:flutter/material.dart';
import 'package:flutter_effect/global_scaffold.dart';

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

  final mySnackBar = SnackBar(content: Text("Updating . . ."), duration: Duration(seconds: 1));

  String _userDisplayName = "";
  String _userName = "";

  @override
  void dispose(){
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
                    fontFamily: 'Roboto'
                ),
                prefixIcon: Icon(Icons.edit,
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
                if(_settingsFormKey.currentState.validate()){
                  if(_userDisplayName != "")
                    Scaffold.of(context).showSnackBar(mySnackBar);

                  setState(() {
                    _userDisplayName = userDisplayController.text;
                  });

                  // TODO: update FireBase with _userDisplayName

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
                    fontFamily: 'Roboto'
                ),
                prefixIcon: Icon(Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              textAlign: TextAlign.center,
//              validator: (nameValue) => nameValue.isEmpty ? "Needs Input" : null,
              controller: userNameController,
              onSaved: (nameValue) => _userName = nameValue,
            ),
            IconButton(
              key: Key("userName"),
              icon: Icon(Icons.save),
              onPressed: () {
                if(_settingsFormKey.currentState.validate()){
                  if(_userName != "")
                    Scaffold.of(context).showSnackBar(mySnackBar);

                  setState(() {
                    _userName = userNameController.text;
                  });

                  // TODO: update FireBase with _userName

                }
              },
            ),
          ],
        ),
      ),
    );
  }


}