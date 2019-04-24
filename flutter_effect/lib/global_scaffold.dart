import 'package:flutter/material.dart';

class GlobalScaffold extends StatelessWidget {
  final Widget drawer;
  final Widget home;
  final Color color;
  final String title;

  const GlobalScaffold({Key key,
    this.drawer, @required this.home, @required this.color,
    @required this.title}) :
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  color,
        title: Text(title,
        ),
        centerTitle: true,
      ),
      drawer: drawer,
      body: home,
    );
  }
}
