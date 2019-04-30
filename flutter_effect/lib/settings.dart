import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/modules/module_list.dart';
import 'package:flutter_effect/global_scaffold.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(color: Theme
        .of(context)
        .backgroundColor,
//    home: ModuleList(modules: modules, saved: widget.saved,),

      home: SettingsPage(),
        title: "Settings",
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomeViewSelection(),
    );
  }
}


class HomeViewSelection extends StatefulWidget {
  @override
  _HomeViewSelectionState createState() => _HomeViewSelectionState();
}

class _HomeViewSelectionState extends State<HomeViewSelection> {
  List<String> listViews = ["Grid View", "List View"];
  String selection = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: selection,
        onChanged: (String newSelection){
          setState((){
            selection = newSelection;
          });
        },
        items: listViews.map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}