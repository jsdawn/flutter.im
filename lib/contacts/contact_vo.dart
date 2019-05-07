import 'package:flutter/material.dart';

// 好友数据VO类
class ContactVO {
  String seationKey;
  String name;
  String avatarUrl;
  ContactVO({@required this.seationKey, this.name, this.avatarUrl});
}

// 好友列表数据
List<ContactVO> contactData = [
  new ContactVO(
    seationKey: 'A',
    name: 'A张三',
    avatarUrl: '',
  ),
  new ContactVO(
    seationKey: 'A',
    name: '阿黄',
    avatarUrl: '',
  ),
  new ContactVO(
    seationKey: 'B',
    name: '波波',
    avatarUrl: '',
  ),
  new ContactVO(
    seationKey: 'C',
    name: '西罗',
    avatarUrl: '',
  ),
  new ContactVO(
    seationKey: 'Y',
    name: '焰灵姬',
    avatarUrl: '',
  ),
];
