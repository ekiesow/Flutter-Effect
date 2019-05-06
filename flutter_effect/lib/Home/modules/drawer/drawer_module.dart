
import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/modules/drawer/drawer_webview.dart';

import 'package:flutter_effect/global_scaffold.dart';

class DrawerModule extends StatefulWidget {
  @override
  _DrawerModuleState createState() => _DrawerModuleState();
}

class _DrawerModuleState extends State<DrawerModule> {

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "Scaffold",
      context: context,
      body: DrawerBody(),
      drawer: ModuleDrawer(),

    );
  }

}

class DrawerBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("Details Coming Soon . . .",
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Center(
            child: Text("See drawer in AppBar.",
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Center(
            child: Text("Typically, the child of a Drawer is a ListView."
                "This is to allow for scrolling if the widgets in your drawer"
                "are longer than the screen.",
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.web),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DrawerWebView()));
              }
          ),
        ],
      ),
    );
  }
}


class ModuleDrawer extends StatefulWidget {
  @override
  _ModuleDrawerState createState() => _ModuleDrawerState();
}

class _ModuleDrawerState extends State<ModuleDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer',
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .backgroundColor,
            ),
          ),
        ] + listTiles + [
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.clear),
            onTap: () {
              Navigator.pop(context);
            }
          ),
          Divider(),
          ListTile(
              title: Text("Back"),
              trailing: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }
          ),
        ]
      ),
    );
  }

  List<Widget> listTiles = [
    ListTile(
      title: Text("Home"),
      trailing: Icon(Icons.home),
    ),
    Divider(),
    ListTile(
      title: Text("Edit"),
      trailing: Icon(Icons.edit),
    ),
    Divider(),
  ];
}

