import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/modules/module_list.dart';

class HomeModule extends StatelessWidget {
//  final Set<String> saved = Set<String>();

  @override
  Widget build(BuildContext context) {
    final Set<String> modules = {"Scaffold", };

    return ModuleList(modules: modules,);
  }
}
