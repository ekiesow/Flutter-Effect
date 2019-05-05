import 'package:flutter/material.dart';

import 'package:flutter_effect/global_scaffold.dart';
import 'package:flutter_effect/shared_pref.dart';

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
              dropDownType(),

            ],
          ),
        ),
      ),
    );
  }

  List<String> colorMenu = ["Blue", "Red"];
  String selection = "Blue";
  Widget dropDownType() {
    return DropdownButton<String>(

      value: selection,
      onChanged: (String newSelection) {
        setState(() {
          this.selection = newSelection;
          SharedPref().updateBackgroundColorPref(getSharedPrefColor());
          SharedPref().getBackgroundColorPref();
//          setColor();

        });
      },

      items: colorMenu.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

    );
  }

  int getSharedPrefColor(){
    for(String selection in colorMenu){
      if(selection == "Blue"){
        return Colors.blue.value;
      }
      else if(selection == "Red"){
        return Colors.red.value;
      }
    }
    return Colors.blue.value;

  }

  String getCurColor(){
    int colorInt = GlobalScaffold.backgroundColorInt;
    if(colorInt == Colors.blue.value){
      return "Blue";
    }
    else if(colorInt == Colors.red.value){
      return "Red";
    }
    return "Blue";
  }


//  void setColor(){
////    GlobalScaffold.backgroundColor = new Color(GlobalScaffold.backgroundColorInt);
//    int colorInt = GlobalScaffold.backgroundColorInt;
//    if(colorInt == Colors.blue.value){
//      GlobalScaffold.backgroundColor = Colors.blue;
//    }
//    else if(colorInt == Colors.red.value){
//      GlobalScaffold.backgroundColor = Colors.red;
//    }
//  }

}


