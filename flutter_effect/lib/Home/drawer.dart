import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Austin Pope",),
              accountEmail: Text("itstheradishspirit",),
              currentAccountPicture: GestureDetector(
                onTap: (){
                  // TODO: go to profile page/edit profile
                },
                child: CircleAvatar(
//                backgroundImage: ,
                  backgroundColor: Colors.white,
                  child: Text("A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor
            ),
            onDetailsPressed: () {
              // TODO: do awesome shit here
            },
          ),
          ListTile(
            title: Text("Module"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {

            },
          ),
          Divider(),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.cancel),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}