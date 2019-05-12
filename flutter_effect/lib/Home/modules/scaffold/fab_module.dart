import 'package:flutter/material.dart';

import 'package:flutter_effect/global_scaffold.dart';
import 'package:flutter_effect/Home/modules/webview.dart';

class FABModule extends StatefulWidget {
  @override
  _FABModuleState createState() => _FABModuleState();
}

class _FABModuleState extends State<FABModule> {
  final url =
      "https://github.com/ekiesow/Flutter-Effect/blob/7905efa168256b23a69772c7317100ab4f51450c/flutter_effect/lib/Home/modules/scaffold/fab_module_code.dart#L1-L58";

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "floatingActionButton",
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 22.0, bottom: 22.0),
                          child: Text("The Floating Action Button (FAB) is generally used"
                              "for actions such as \"share,\" \"Navigate,\" and other similar"
                              "actions. It is not typical to use more than one FAB per route (screen).",
                            textAlign: TextAlign.start,
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
                                      title: "floatingActionButton",
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
