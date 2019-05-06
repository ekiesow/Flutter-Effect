import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_effect/global_scaffold.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name;

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              // TODO: add background image from account, if null show background with first letter of name
//                    backgroundImage: ,
              backgroundColor: Theme.of(context).backgroundColor,
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection("username")
                    .document("3zqigfRFGwW3gSCEgeME")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Text("Error");
                  name = snapshot.data['username'].toString();
                  name = name.substring(0, 1);
                  return Text("$name",
                    style: TextStyle(fontSize: 40),);
                },
              ),
              radius: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: <Widget>[
                  // TODO: get user's name from FB
                  StreamBuilder(
                    stream: Firestore.instance
                        .collection("username")
                        .document("3zqigfRFGwW3gSCEgeME")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Text("Error");
                      return Text(
                        snapshot.data['username'].toString(),
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Theme.of(context).primaryColor),
                      );
                    },
                  ),
                  // TODO: get username from FB
                  StreamBuilder(
                    stream: Firestore.instance
                        .collection("name")
                        .document("VvqgGrzToXRYvqRqAYDp")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Text("Error");
                      return Text(snapshot.data['name'].toString(),
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor),);
                    },
                  ),
                  StreamBuilder(
                    stream: Firestore.instance
                        .collection("email")
                        .document("nYa62ZVHCFayRavfNuNn")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Text("Error");
                      return Text(snapshot.data['email'].toString(),
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor),);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Member since: 1969",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      title: "Profile",
    );
  }
}
