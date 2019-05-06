import 'package:flutter/material.dart';
import 'package:flutter_effect/global_scaffold.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GlobalScaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: <Widget>[
              Text("hello"),
            ],
          ),
        )
    );
  }
}