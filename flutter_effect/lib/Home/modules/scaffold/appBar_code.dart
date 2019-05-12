import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
    );
  }

  AppBar myAppBar(){
    return AppBar(

      // Give the AppBar a title.
      title: Text("AppBar"),

      // Bool to center the title.
      centerTitle: true,

      // Pick the color of your appBar.
      backgroundColor:  Colors.lightBlueAccent,
      /*
       * You may also use Theme.of(context).appBarTheme
       * if main returns MaterialApp with
       * theme: ThemeData(
       *  primarySwatch: Colors.myColorChoice
       *  or
       *  primaryColor: Colors.myColorChoice
       * )
       */

      // Have an action on the right hand side of the AppBar.
      actions: <Widget>[
        IconButton(icon: Icon(
          Icons.star,
          color: Colors.yellow,
          ),
          onPressed: (){
           // Navigate to route of saved items.
         }
        )
      ],

      // There are many more options to choose from to customize your AppBar.

    );
  }
}
