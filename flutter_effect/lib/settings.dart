import 'package:flutter/material.dart';
import 'package:flutter_effect/global_scaffold.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  final myFormController = TextEditingController();
  String _usrName;
  String _usrUserName;
  @override
  Widget build(BuildContext context) {

    return GlobalScaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
              )
            ],
          ),
        ),
        title: "Settings",
    );
  }
}