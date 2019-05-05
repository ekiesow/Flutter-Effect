import 'package:flutter/material.dart';

import 'package:flutter_effect/profile.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<Widget> otherAccounts = [IconButton(icon: Icon(Icons.settings), onPressed: (){
    print("tapped");
  }),];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            // TODO: get user's name from FB
            accountName: Text("Austin Pope"),
            // TODO: get username from FB
            accountEmail: Text("itstheradishspirit"),
            currentAccountPicture: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: CircleAvatar(
                // TODO: add background image from account, if null show background with first letter of name
//                backgroundImage: ,
                backgroundColor: Colors.white,
                child: Text("A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            otherAccountsPictures: otherAccounts,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor
            ),
//            onDetailsPressed: () {
//              // TODO: do awesome stuff here, or not
//              setState(() {
//                return HomeViewSelection();
//              });
//            },
          ),
          moduleListTile("Scaffold"),
          Divider(),
          moduleListTile("Drawer"),
          Divider(),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget moduleListTile(String moduleName){
    return ListTile(
      title: Text(moduleName),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).pushNamed(moduleName);
      },
    );
  }

}



