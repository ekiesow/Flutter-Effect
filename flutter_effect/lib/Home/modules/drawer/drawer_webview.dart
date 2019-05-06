import 'package:flutter/material.dart';
import 'package:flutter_effect/global_scaffold.dart';
import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

class DrawerWebView extends StatefulWidget {
  @override
  _DrawerWebViewState createState() => _DrawerWebViewState();
}

class _DrawerWebViewState extends State<DrawerWebView> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
        title: null,
      body: WebView(
        initialUrl: "www.google.com",
//        initialUrl: "https://github.com/ekiesow/Flutter-Effect/blob/e5f1ef99590a061f105a4796f5071be253a0580f/flutter_effect/lib/Home/modules/drawer/module_code.dart#L11-L33",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }

}
