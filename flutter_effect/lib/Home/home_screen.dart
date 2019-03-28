import 'package:flutter/material.dart';

class FlutterEffectHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Theme.of(context).backgroundColor,
        title: Text("Flutter Effect",
        ),
        centerTitle: true,
      ),
      drawer: HomeDrawer(),
    body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int index = 4;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12.0),
        itemCount: index,
        itemBuilder: (context, index) {
          return Text("List Tile #: $index");
        },
    );
  }
}

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: CircleAvatar(
                    child: Wrap(
                      children: <Widget>[
                        Text("Your Picture")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Your Username",
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor
            ),
          ),
        ],
      ),
    );
  }
}
