import 'package:flutter/material.dart';
import 'package:flutter_effect/shared_pref.dart';

class GlobalScaffold extends StatefulWidget {
  final Widget drawer;
  final Widget body;
  final Color color;
  final String title;
  static int backgroundColorInt;
  static Color backgroundColor;
  final BuildContext context;

  const GlobalScaffold({Key key,
    this.drawer, @required this.body, this.color,
    @required this.title, this.context}) :
        super(key: key);

  @override
  _GlobalScaffoldState createState() => _GlobalScaffoldState();
}

class _GlobalScaffoldState extends State<GlobalScaffold> {

  _GlobalScaffold() {
    FutureBuilder<dynamic>(
      future: SharedPref().getBackgroundColorPref(GlobalScaffold.backgroundColorInt),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        return snapshot.hasData ?
        parseColor(snapshot.data, GlobalScaffold.backgroundColor) :
        getDefaultColor(widget.context, GlobalScaffold.backgroundColor);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalScaffold.backgroundColor,
        title: Text(widget.title,
        ),
        centerTitle: true,
      ),
      drawer: widget.drawer,
      body: widget.body,
    );
  }

  getDefaultColor(BuildContext context, Color backgroundColor) {
    backgroundColor = Colors.lightBlue;
  }

  parseColor(int value, Color backgroundColor){
    backgroundColor = new Color(value);

  }
}