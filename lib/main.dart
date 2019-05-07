import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import './app.dart';
import './loading.dart';
import './search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 路由表
    var routes = <String, WidgetBuilder>{
      "app": (BuildContext context) => new App(),
      "/friends": (_) => new WebviewScaffold(
            // webview 插件
            url: "https://flutter.io",
            appBar: new AppBar(
              title: Text('Flutter 官网'),
            ),
            withZoom: true,
            withLocalStorage: true, // 是否本地储存
          ),
      'search': (BuildContext context) => new Search(),
    };
    // end
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IM',
      theme: mDefaultTheme,
      home: new LoadingPage(),
      routes: routes,
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.green,
);
