import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contact.dart';
import './personal/person.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // 当前选中状态
  var _currentIndex = 0;

  // 聊天页面
  MessagePage message;
  // 好友列表页面
  Contact contact;
  // 好友列表页面
  Personal personal;

  // 根据当前索引返回不同页面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        // 返回聊天界面
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        // 返回好友页面
        if (contact == null) {
          contact = new Contact();
        }
        return contact;
      case 2:
        // 返回我的页面
        if (personal == null) {
          personal = new Personal();
        }
        return personal;
      default:
    }
  }

  // 渲染某个菜单项，参数：标题、图标或图片路径
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(imagePath, width: 28.0, height: 28.0)
              : SizedBox(
                  width: 28.0,
                  height: 28.0,
                  child: Icon(icon, color: Colors.white),
                ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('即时通信'),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                  items: <PopupMenuEntry>[
                    _popupMenuItem('发起会话',
                        imagePath: 'images/icon_menu_ dialogue.png'),
                    _popupMenuItem('添加好友',
                        imagePath: 'images/icon_menu_addfriend.png'),
                    _popupMenuItem('联系客服',
                        imagePath: 'images/icon_menu_service.png'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          new BottomNavigationBarItem(
            icon: Image.asset(
              'images/tab_message_normal.png',
              width: 32.0,
              height: 28.0,
            ),
            title: new Text(
              '聊天',
              style: TextStyle(
                color: _currentIndex == 0 ? Colors.green : Color(0xff666666),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Image.asset(
              'images/tab_contact_list_normal.png',
              width: 32.0,
              height: 28.0,
            ),
            title: new Text(
              '好友',
              style: TextStyle(
                color: _currentIndex == 1 ? Colors.green : Color(0xff666666),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Image.asset(
              'images/tab_profile_normal.png',
              width: 32.0,
              height: 28.0,
            ),
            title: new Text(
              '我的',
              style: TextStyle(
                color: _currentIndex == 2 ? Colors.green : Color(0xff666666),
              ),
            ),
          ),
        ],
      ),
      body: new Center(
        child: currentPage(),
      ),
    );
  }
}
