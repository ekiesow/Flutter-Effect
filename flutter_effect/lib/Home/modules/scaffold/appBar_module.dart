import 'package:flutter/material.dart';


import 'package:flutter_effect/global_scaffold.dart';
import 'package:flutter_effect/shared_pref.dart';
import 'package:flutter_effect/Home/modules/webview.dart';

class AppBarModule extends StatefulWidget {
  @override
  _AppBarModuleState createState() => _AppBarModuleState();
}

class _AppBarModuleState extends State<AppBarModule> {
  Color appBarColor;
  final url =
      "https://gist.github.com/ekiesow/54f41e3e6661088b0c666a08b17432fb";

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "AppBar",
      body: Padding(
        padding: const EdgeInsets.only(top: 250.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Card(
                color: Colors.lightBlue[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        leading: IconButton(
                            icon: Icon(Icons.web,
                              color: Colors.black,
                            ),
                            iconSize: 44.0,
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ModuleWebView(
                                        title: "AppBar",
                                        url: url,)
                                  )
                              );
                            }
                        ),
                        trailing: Center(child: dropDownType()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      color: appBarColor,
    );
  }

  List<String> colorMenu = ["Blue", "Red", "Green", "Purple"];
  String selection = "Blue";
  Widget dropDownType() {
    return DropdownButton<String>(

      value: selection,
      onChanged: (String newSelection) {
        setState(() {
          this.selection = newSelection;
          setColor();
          getCurColor();

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

//  int getSharedPrefColor(){
//    for(String selection in colorMenu){
//      if(selection == "Blue"){
//        return Colors.blue.value;
//      }
//      else if(selection == "Red"){
//        return Colors.red.value;
//      }
//    }
//    return Colors.blue.value;
//
//  }
//
  getCurColor(){
    int colorInt = GlobalScaffold.backgroundColorInt;
    if(colorInt == Colors.blue.value){
      setState(() {
        appBarColor = Colors.blue;

      });
    }
    else if(colorInt == Colors.red.value){
      setState(() {
        appBarColor = Colors.red;

      });
    }
    else if(colorInt == Colors.green.value){
      setState(() {
        appBarColor = Colors.green;

      });
    }
    else if(colorInt == Colors.purple.value){
      setState(() {
        appBarColor = Colors.purple;

      });
    }
    else{
      setState(() {
        appBarColor = Colors.blue;

      });
    }
  }


  void setColor(){
//    GlobalScaffold.backgroundColor = new Color(GlobalScaffold.backgroundColorInt);
//    int colorInt = GlobalScaffold.backgroundColorInt;
//    if(colorInt == Colors.blue.value){
//      GlobalScaffold.backgroundColor = Colors.blue;
//    }
//    else if(colorInt == Colors.red.value){
//      GlobalScaffold.backgroundColor = Colors.red;
//    }
    if(selection == "Blue"){
      print("setColor: Blue");
      setState(() {
        GlobalScaffold.backgroundColorInt = Colors.blue.value;
        SharedPref().updateBackgroundColorPref();

      });
    }
    else if(selection == "Red"){
      print("setColor: Red");
      setState(() {
        GlobalScaffold.backgroundColorInt = Colors.red.value;
        SharedPref().updateBackgroundColorPref();

      });
    }
    else if(selection == "Green"){
      print("setColor: Green");
      setState(() {
        GlobalScaffold.backgroundColorInt = Colors.green.value;
        SharedPref().updateBackgroundColorPref();

      });
    }
    else if(selection == "Purple"){
      print("setColor: Purple");
      setState(() {
        GlobalScaffold.backgroundColorInt = Colors.purple.value;
        SharedPref().updateBackgroundColorPref();

      });
    }
    else{
      setState(() {
        GlobalScaffold.backgroundColorInt = Colors.blue.value;
        SharedPref().updateBackgroundColorPref();

      });
    }
  }

}


