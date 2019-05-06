import 'package:flutter/material.dart';
import 'package:flutter_effect/profile.dart';
import 'package:flutter_effect/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String name;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            // TODO: get user's name from FB
            accountName: StreamBuilder(
              stream: Firestore.instance
                  .collection("name")
                  .document("VvqgGrzToXRYvqRqAYDp")
                  .snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData) return Text("Error");
                name = snapshot.data['name'].toString();
                return Text(snapshot.data['name'].toString());
              },
            ),
            accountEmail: StreamBuilder(
              stream: Firestore.instance
                  .collection("email")
                  .document("nYa62ZVHCFayRavfNuNn")
                  .snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData) return Text("Error");
                print(name);
                return Text(snapshot.data['email'].toString());
              },
            ),
            currentAccountPicture: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: CircleAvatar(
                // TODO: add background image from account,
                //  TODO: if null show background with first letter of name
//                backgroundImage: ,
                backgroundColor: Colors.white,
                child: Text("A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            otherAccountsPictures: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));                  }
              )
            ],
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



