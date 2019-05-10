import 'package:flutter/material.dart';
import './touch_callback.dart';

// 通用列表项
class ImItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Icon icon;
  final VoidCallback onPressed;

  ImItem(
      {Key key,
      @required this.title,
      this.imagePath,
      this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      onPressed: onPressed ?? () {},
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 22.0, right: 20.0),
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: 32.0,
                      height: 32.0,
                    )
                  : SizedBox(
                      height: 32.0,
                      width: 32.0,
                      child: icon,
                    ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xff353535),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
