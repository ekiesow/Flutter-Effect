import 'package:flutter/material.dart';
import 'package:flutter_effect/global_scaffold.dart';

class AppBarModule extends StatefulWidget {
  @override
  _AppBarModuleState createState() => _AppBarModuleState();
}

class _AppBarModuleState extends State<AppBarModule> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "AppBar",
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                      onPressed: null,
                      child: null)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  List<String> menuItems = ["micro", "regional", "brewpub", "large", "planning",
    "bar", "contract", "proprietor"];
  String selection = "";
  Widget dropDownType() {
    return DropdownButton<String>(

      value: selection,
      onChanged: (String newSelection) {
        setState(() {
          selection = newSelection;
        });
      },

      items: menuItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

    );
  }

}


