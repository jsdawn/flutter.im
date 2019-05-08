import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './contact_vo.dart';

class ContactSiderList extends StatefulWidget {
  // 好友列表项数据
  final List<ContactVO> items;
  // 好友列表头构造器
  final IndexedWidgetBuilder headerBuilder;
  // 好友列表项构造器
  final IndexedWidgetBuilder itemBuilder;
  // 字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  // 构造方法
  ContactSiderList(
      {Key key,
      @required this.items,
      this.headerBuilder,
      @required this.itemBuilder,
      @required this.sectionBuilder})
      : super(key: key);

  _ContactSiderListState createState() => _ContactSiderListState();
}

class _ContactSiderListState extends State<ContactSiderList> {
  // 滚动列表控制器
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  // 判断并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  // 根据定位判断是否显示好友列表头
  bool _shouldShowHeader(int positon) {
    if (positon <= 0) {
      return false;
    }
    if (positon != 0 &&
        widget.items[positon].seationKey !=
            widget.items[positon - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // 列表加载更多
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              // 滚动控制器
              controller: _scrollController,
              // 列表不足一屏也可滚动
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      // 显示列表头
                      _isShowHeaderView(index),
                      // 用 Offstage 组件控制是否显示英文字母
                      Offstage(
                        offstage: _shouldShowHeader(index),
                        child: widget.sectionBuilder(context, index),
                      ),
                      Column(
                        children: <Widget>[
                          widget.itemBuilder(context, index),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
