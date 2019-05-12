import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ModuleWebView extends StatefulWidget {
  final String url;
  final String title;

  const ModuleWebView({Key key, @required this.url, @required this.title}) :
        super(key: key);

  @override
  _ModuleWebViewState createState() => _ModuleWebViewState();
}

class _ModuleWebViewState extends State<ModuleWebView> {

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
        url: widget.url,
    );
  }

}
