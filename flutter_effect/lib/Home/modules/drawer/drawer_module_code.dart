import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      /*
       * listView makes the Drawer scrollable.
       * It is a good idea to make the child of the Drawer a listView
       * just in case the Drawer gets filled with Widgets.
       */
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          /*
           * The DrawerHeader should be the first Widget in the list.
           * This is to keep your widgets from getting crammed at the top of
           * the screen and gives you a nice space to show any information
           * the user might need to know, if applicable.
           */
          DrawerHeader(
            child: Text('Drawer Header',
            ),
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .backgroundColor,
            ),
          ),

          /*
           * You can add one or many ListTile Widgets to allow the user to
           * navigate quickly throughout your app or give other actions to the
           * ListTile. Any other Widgets may be used in the listView as well.
           */
          ListTile(
              title: Text("Close Drawer"),
              trailing: Icon(Icons.clear),
              onTap: () {
                Navigator.pop(context);
              }
          ),
        ],
      ),
    );
  }
}
