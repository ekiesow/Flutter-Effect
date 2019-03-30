import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/home_screen.dart';

void main() => runApp(FlutterEffect());

class FlutterEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primaryColor: Colors.blueAccent,
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: FlutterEffectHome(),
    );
  }
}

