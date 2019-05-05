import 'package:flutter/material.dart';
import 'package:flutter_effect/Auth/auth.dart';
import 'package:flutter_effect/Auth/auth_provider.dart';
import 'package:flutter_effect/Auth/root_page.dart';

void main() => runApp(FlutterEffect());

class FlutterEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'FlutterEffect',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
    );
  }
}

