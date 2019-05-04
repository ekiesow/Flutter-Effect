import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/modules/home_module.dart';
import 'package:flutter_effect/Home/modules/module_list.dart';
import 'package:flutter_effect/drawer.dart';
import 'package:flutter_effect/global_scaffold.dart';

class FlutterEffectHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: HomeModule(),
      drawer: MainDrawer(),
      title: "Flutter Effect",
      context: context,
    );
  }
}