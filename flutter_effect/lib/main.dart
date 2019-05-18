import 'package:flutter/material.dart';

import 'package:flutter_effect/Auth/auth.dart';
import 'package:flutter_effect/Auth/auth_provider.dart';
import 'package:flutter_effect/Auth/root_page.dart';
import 'package:flutter_effect/Home/modules/drawer/drawer_module.dart';
import 'package:flutter_effect/Home/modules/scaffold/appBar_module.dart';
import 'package:flutter_effect/Home/modules/scaffold/bottom_nav_bar_module.dart';
import 'package:flutter_effect/Home/modules/scaffold/fab_module.dart';
import 'package:flutter_effect/Home/modules/scaffold/scaffold_module.dart';

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
        routes: {
          'Scaffold' : (context) => ScaffoldModule(),
          'AppBar' : (context) => AppBarModule(),
        'Drawer' : (context) => DrawerModule(),
          'floatingActionButton' : (context) => FABModule(),
          'bottomNagivationBar': (context) => BottomNavBarModule(),

        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

