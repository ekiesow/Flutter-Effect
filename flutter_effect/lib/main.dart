import 'package:flutter/material.dart';

void main() => runApp(FlutterEffect());

class FlutterEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

