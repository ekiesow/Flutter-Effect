import 'package:flutter/material.dart';

import 'package:flutter_effect/Home/modules/home_module.dart';
import 'package:flutter_effect/drawer.dart';
import 'package:flutter_effect/global_scaffold.dart';
import 'package:flutter_effect/Auth/auth.dart';
import 'package:flutter_effect/Auth/auth_provider.dart';

class FlutterEffectHome extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: HomeModule(),
      drawer: MainDrawer(),
      title: "Flutter Effect",
      actions: <Widget>[
        FlatButton(
          child: Text('Logout', style: TextStyle(fontSize: 17.0, color: Colors.white)),
          onPressed: () => _signOut(context),
        )
      ],
      context: context,
    );
  }
}