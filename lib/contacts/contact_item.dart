import 'package:flutter/material.dart';
import './contact_vo.dart';

// 好友列表项
class ContactItem extends StatelessWidget {
  // 好友数据VO
  final ContactVO item;
  // 标题名
  final String titleName;
  // 图片路径
  final String imageName;
  // 构建方法
  ContactItem({Key key, this.item, this.titleName, this.imageName});

  // 渲染好友列表项
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 展示头像或图片
            imageName == null
                ? (item.avatarUrl != ''
                    ? Image.network(item.avatarUrl,
                        width: 30.0, height: 30.0, scale: 0.9)
                    : Image.asset('images/default_avatar.jpeg',
                        width: 30.0, height: 30.0, scale: 0.9))
                : Image.asset(imageName, width: 30.0, height: 30.0),
            // 展示名称或标题
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? (item.name ?? '暂时') : titleName,
                style: TextStyle(fontSize: 18.0, color: Color(0xff353535)),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
