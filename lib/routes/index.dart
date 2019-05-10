import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../app.dart';
import '../search.dart';

Map<String, WidgetBuilder> routes = {
  "app": (BuildContext context) => new App(),
  "/friends": (_) => new WebviewScaffold(
        // webview 插件
        url: "https://landing.toutiao.com/",
        appBar: new AppBar(
          title: Text('今日头条'),
        ),
        withZoom: true,
        withLocalStorage: true, // 是否本地储存
      ),
  'search': (BuildContext context) => new Search(),
};
