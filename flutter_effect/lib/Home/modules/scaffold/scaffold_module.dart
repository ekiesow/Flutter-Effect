import 'package:flutter/material.dart';

import 'package:flutter_effect/Home/modules/module_list.dart';
import 'package:flutter_effect/global_scaffold.dart';

class ScaffoldModule extends StatefulWidget {
//  final Set<String> saved;

//  const ScaffoldModule({Key key, @required this.saved}) : super(key: key);

  @override
  _ScaffoldModuleState createState() => _ScaffoldModuleState();
}

class _ScaffoldModuleState extends State<ScaffoldModule> {
  final Set<String> modules = {"AppBar", "bottomNagivationBar",
  "floatingActionButton", };

  @override
  Widget build(BuildContext context) {
  return GlobalScaffold(
//    home: ModuleList(modules: modules, saved: widget.saved,),

    body: ModuleList(modules: modules,),
//      drawer: MainDrawer(),
    title: "Scaffold",
    context: context,
    );

  }
}
