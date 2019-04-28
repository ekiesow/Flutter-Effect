import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              // TODO: add background image from account,
              //  TODO: if null show background with first letter of name
//                    backgroundImage: ,
              backgroundColor: Theme.of(context).backgroundColor,
              child: Text("E",
                style: TextStyle(fontSize: 40.0,
                    color: Colors.white),
              ),
              radius: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: <Widget>[
                  // TODO: get user's name from FB
                  Text("Eric Kiesow",
                    style: TextStyle(fontSize: 40.0,
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  // TODO: get username from FB
                  Text("LameUserName",
                    style: TextStyle(fontSize: 20.0,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 12.0),
            ),
            Divider(color: Theme.of(context).dividerColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text("Member since: 1969",
                style: TextStyle(fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}