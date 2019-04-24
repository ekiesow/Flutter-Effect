import 'package:flutter/material.dart';
import 'package:flutter_effect/Home/home_screen.dart';
import 'package:flutter_effect/Home/modules/scaffold/scaffold_module.dart';

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
      initialRoute: '/',
      routes: {
        '/' : (context) => FlutterEffectHome(),
        'Scaffold' : (context) => ScaffoldModule(),
    },
      debugShowCheckedModeBanner: false,
//      home: FlutterEffectHome(),
    );
  }
}

