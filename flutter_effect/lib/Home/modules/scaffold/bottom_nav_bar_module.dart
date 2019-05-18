import 'package:flutter/material.dart';

import 'package:flutter_effect/Home/modules/webview.dart';
import 'package:flutter_effect/global_scaffold.dart';

class BottomNavBarModule extends StatefulWidget {
  @override
  _BottomNavBarModuleState createState() => _BottomNavBarModuleState();
}

class _BottomNavBarModuleState extends State<BottomNavBarModule> {
  final String url =
      "https://gist.github.com/ekiesow/36b4c8c0d1cdeeeb8d11334debabf941";
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      title: "BottomNavigationBar",
      bottomNavigationBar: bottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 00.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 22.0, right: 22.0),
              child: Card(
                color: Colors.lightBlue[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 22.0, bottom: 22.0),
                          child: _dialogMessage.elementAt(_selectedIndex),
                        ),
                      ),
                      leading: _selectionIcon.elementAt(_selectedIndex),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Card(
                color: Colors.lightBlue[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 22.0, bottom: 22.0),
                          child: Text("The name of the Widget says it all!\n"
                              "The Bottom Navigation Bar is a very intuitive way for the user "
                              "to navigate through an app. It also happens to be easy to implement!\n\n"
                              "The BottomNavigationBar needs a list of items, typically a list of "
                              "BottomNavigationBarItem Widgets. The BottomNavigationBarItem takes a title, "
                              "an icon, and an activeIcon for when the navigation item is selected. "
                              "You can give the activeIcon the same icon with a new color for when the item is "
                              "selected or an entirely new Icon. Give the BottomNavigationBar an onTap method "
                              "and setState to update the current index. You can use the current index to display "
                              "the appropriate Widget. This is great as the user never leaves the current route and "
                              "navigation is seamless.",
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
                                      title: "BottomNavigationBar",
                                      url: url,)
                                ),
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



  Widget bottomNavigationBar(){
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home,
            color: Colors.lightBlueAccent,
          ),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          activeIcon: Icon(Icons.message,
            color: Colors.lightBlueAccent,
          ),
          title: Text("Message"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          activeIcon: Icon(Icons.people,
            color: Colors.lightBlueAccent,
          ),
          title: Text("Contacts"),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index){
        setState(() {
          _selectedIndex = index;
        });

      },
    );
  }

  static const List<Widget> _dialogMessage = <Widget>[
    Text("Take me Home!",
      textAlign: TextAlign.start,
    ),
    Text("View my Messages!",
      textAlign: TextAlign.start,
    ),
    Text("View my Contacts!",
      textAlign: TextAlign.start,
    ),
  ];

  static const List<Widget> _selectionIcon = <Widget>[
    Icon(Icons.home, size: 44.0, color: Colors.black,),
    Icon(Icons.message, size: 44.0, color: Colors.black,),
    Icon(Icons.people, size: 44.0, color: Colors.black,),
  ];


}
