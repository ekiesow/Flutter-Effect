import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DrawerWebView extends StatefulWidget {
  @override
  _DrawerWebViewState createState() => _DrawerWebViewState();
}

class _DrawerWebViewState extends State<DrawerWebView> {
  final String url = "https://github.com/ekiesow/Flutter-Effect/blob/e5f1ef99590a061f105a4796f5071be253a0580f/flutter_effect/lib/Home/modules/drawer/module_code.dart#L11-L33";
//  final String url = "https://www.google.com";

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
        url: url,
    );
  }

}
