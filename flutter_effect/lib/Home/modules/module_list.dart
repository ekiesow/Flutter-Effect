import 'package:flutter/material.dart';

class ModuleList extends StatefulWidget {
  final Set<String> modules;

  const ModuleList({Key key, @required this.modules, }) : super(key: key);

  @override
  _ModuleListState createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {

  static final Set<String> saved = Set<String>();
  static bool grid = true;


  @override
  Widget build(BuildContext context) {
    if(grid == true) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.modules.length,
        itemBuilder: (context, index) {
          String currentModule = widget.modules.elementAt(index);
          final bool alreadySaved = saved.contains(currentModule);
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(currentModule);
                // , arguments: widget.saved
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(alreadySaved ? Icons.star : Icons.star_border,
                            color: alreadySaved ? Colors.yellow : null,
                          ),
                          onPressed: () {
                            setState(() {
                              if(alreadySaved)
                                saved.remove(currentModule);
                              else
                                saved.add(currentModule);
                            });
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Center(
                        child: moduleText(currentModule),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          },
      );
    }
    else{
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.modules.length,
        itemBuilder: (context, index){
          String currentModule = widget.modules.elementAt(index);
          final bool alreadySaved = saved.contains(currentModule);
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(currentModule);
                // , arguments: widget.saved
              },
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                        child: moduleText(currentModule),
                      ),
                    ),
                    IconButton(
                      icon: Icon(alreadySaved ? Icons.star : Icons.star_border,
                        color: alreadySaved ? Colors.yellow : null,
                      ),
                      onPressed: () {
                        setState(() {
                          if(alreadySaved)
                            saved.remove(currentModule);
                          else
                            saved.add(currentModule);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
          },
      );
    }
  }

  Widget moduleText(String moduleName){
    return Wrap(
      children: <Widget>[
        Text(moduleName,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16.0,
//        fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

}