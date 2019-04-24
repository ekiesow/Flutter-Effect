import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/modules/home_module.dart';
import 'package:flutter_effect/drawer.dart';

class FlutterEffectHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Theme.of(context).backgroundColor,
        title: Text("Flutter Effect",
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
    body: HomeModule(),
    );
  }
}

//return GlobalScaffold(color: Theme.of(context).backgroundColor,
//home: HomeModule(),
//drawer: MainDrawer(),
//title: "Flutter Effect",
//);
