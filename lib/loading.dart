import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // 在加载页面停留3秒
    new Future.delayed(Duration(seconds: 3), () {
      print('Flutter 即时通信App 界面实现');
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          // 加载页面居中背景图 使用cover模式
          Image.asset(
            'images/loading.jpeg',
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
