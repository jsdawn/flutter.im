// 消息类型枚举类型
enum MessageType { SYSTEM, PUBLIC, CHAT, GROUP }

// 聊天数据VO类
class MessageData {
  String avatar;
  String title;
  String subTitle;
  DateTime time;
  MessageType type;
  MessageData(this.avatar, this.title, this.time, this.subTitle, this.type);
}

// 列表数据存储
List<MessageData> messageData = [
  new MessageData('images/default_avatar.jpeg', '焰灵姬', new DateTime.now(),
      '天行九歌', MessageType.CHAT),
  new MessageData('images/default_avatar.jpeg', '韩非', new DateTime.now(),
      '天行九歌', MessageType.CHAT),
  new MessageData('images/default_avatar.jpeg', '卫庄', new DateTime.now(),
      '天行九歌', MessageType.CHAT),
  new MessageData('images/default_avatar.jpeg', '紫女', new DateTime.now(),
      '天行九歌', MessageType.CHAT),
  new MessageData('images/default_avatar.jpeg', '弄玉', new DateTime.now(),
      '天行九歌', MessageType.CHAT),
  new MessageData('images/default_avatar.jpeg', '张良', new DateTime.now(),
      '天行九歌', MessageType.CHAT),
  new MessageData('images/default_avatar.jpeg', '红莲', new DateTime.now(),
      '天行九歌', MessageType.CHAT),
];
