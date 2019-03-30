import 'package:flutter/material.dart';
import 'package:flutter_effect/drawer.dart';

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
      drawer: MainDrawer(),
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: index,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.star_border),
                            onPressed: () {
                              //TODO: add saved method
                            },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Center(
                          child: Text("List Tile: $index"),
                      ),
                    ),
                  ],
                ),
            ),
          );
        },
    );
  }
}

