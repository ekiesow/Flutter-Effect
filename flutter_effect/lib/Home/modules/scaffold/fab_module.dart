import 'package:flutter/material.dart';

import 'package:flutter_effect/global_scaffold.dart';
import 'package:flutter_effect/Home/modules/webview.dart';

class FABModule extends StatefulWidget {
  @override
  _FABModuleState createState() => _FABModuleState();
}

class _FABModuleState extends State<FABModule> {
  final url = "";

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "floatingActionButton",
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text("The Floating Action Button (FAB) is generally used"
                    "for actions such as \"share,\" \"Navigate,\" and other similar"
                    "actions. It is not typical to use more than one FAB per route (screen).",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.web),
                iconSize: 44.0,
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          ModuleWebView(
                            title: "floatingActionButton",
                            url: url,)
                      )
                  );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget floatingActionButton(){
    return FloatingActionButton(
      child: Icon(Icons.send),
      backgroundColor: Colors.blueAccent,
      onPressed: (){
        return showDialog(
            context: context,
          builder: (context){
            return AlertDialog(
              content: Text("Message Sent!",
                textAlign: TextAlign.center,
              ),
            );
          }
        );
      },
    );
  }
}
