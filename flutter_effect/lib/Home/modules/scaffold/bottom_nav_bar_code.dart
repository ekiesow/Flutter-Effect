import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My BottomNavigationBar"),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),

      /*
       * bottomNavigationBar takes a widget.
       */
      bottomNavigationBar: bottomNavigationBar(),

      /*
       * body which shows a different Widget for each BottomNavigationBarItem
       */
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 22.0, bottom: 22.0),

                    // Displays the Widget at the index of the selected NavigationBarItem
                    child: _dialogMessage.elementAt(_selectedIndex),
                  ),
                ),

                // Displays the Widget at the index of the selected NavigationBarItem
                leading: _selectionIcon.elementAt(_selectedIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
   * BottomNavigationBar takes a list of items.
   * BottomNavigationBarItem displays an icon, and title.
   *    activeIcon is displayed when the BottomNavigationBarItem is selected.
   *    The color of the icon is changed when selected.
   *    You can also display another icon.
   * currentIndex is the current index of the selected BottomNavigationBarItem.
   *    setState to update the selected index
   *    This is used to select which widget is displayed for each BottomNavigationBarItem.
   */
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

  /*
   * The List of Widgets to be displayed for each BottomNavigationBarItem
   */
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

  /*
   * The List of Widgets to be displayed for each BottomNavigationBarItem
   */
  static const List<Widget> _selectionIcon = <Widget>[
    Icon(Icons.home, size: 44.0, color: Colors.black,),
    Icon(Icons.message, size: 44.0, color: Colors.black,),
    Icon(Icons.people, size: 44.0, color: Colors.black,),
  ];


}
