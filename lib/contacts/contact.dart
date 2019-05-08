import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './contact_sider_list.dart';
import './contact_header.dart';
import './contact_item.dart';
import './contact_vo.dart';

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactSiderList(
        items: contactData,
        headerBuilder: (BuildContext context, int index) {
          return Container(
            child: ContactHeader(),
          );
        },
        // 好友列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(
              item: contactData[index],
            ),
          );
        },
        // 字母构造器
        sectionBuilder: (BuildContext context, int index) {
          return Container(
            height: 32.0,
            padding: const EdgeInsets.only(left: 14.0),
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Text(
              contactData[index].seationKey,
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff909090),
              ),
            ),
          );
        },
      ),
    );
  }
}
