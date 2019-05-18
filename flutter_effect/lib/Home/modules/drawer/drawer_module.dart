
import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/modules/webview.dart';

import 'package:flutter_effect/global_scaffold.dart';

class DrawerModule extends StatefulWidget {
  @override
  _DrawerModuleState createState() => _DrawerModuleState();
}

class _DrawerModuleState extends State<DrawerModule> {

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "Drawer Header",
      context: context,
      body: DrawerBody(),
      drawer: ModuleDrawer(),

    );
  }

}

class DrawerBody extends StatelessWidget {
  final String url =
      "https://gist.github.com/ekiesow/1f27ba6bebff55ce59227274d90d6d61";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 125.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Card(
                color: Colors.lightBlue[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 22.0, bottom: 22.0),
                        child: Text("Typically, the child of a Drawer is a ListView. "
                            "This is to allow for scrolling if the widgets in your drawer"
                            " are longer than the screen. Then add a DrawerHeader widget "
                            "as the first parameter in the ListView to allow for space "
                            "at the top so it does not get cut off and look cluttered."
                            "\n\nSee the drawer in the menu above."
                            " \nSelect the web icon to view example code.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      leading: IconButton(
                          icon: Icon(Icons.web,
                            color: Colors.black,
                          ),
                          iconSize: 44.0,
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    ModuleWebView(
                                      title: "Drawer",
                                      url: url,)
                                )
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
          ListTile(
            title: Text("Home"),
            trailing: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }
          ),
          Divider(),
          ListTile(
            title: Text("Edit"),
            trailing: Icon(Icons.edit),
          ),
          Divider(),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.clear),
            onTap: () {
              Navigator.pop(context);
            }
          ),
          Divider(),
        ]
      ),
    );
  }

}

