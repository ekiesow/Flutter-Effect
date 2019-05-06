import 'package:flutter/material.dart';

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
      child: Center(
        child: Text("Coming Soon . . .",
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
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

