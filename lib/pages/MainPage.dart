import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'MessagePage.dart';
import 'MinePage.dart';
import 'VideoListPage.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class _Item {
  String activeIcon, normalIcon;
  _Item(this.activeIcon, this.normalIcon);
}

class MainPageState extends State<MainPage> {
  final items = [
    _Item('assets/images/tab_home_s.png', 'assets/images/tab_home_n.png'),
    _Item('assets/images/tab_video_s.png', 'assets/images/tab_video_n.png'),
    _Item('assets/images/tab_message_s.png', 'assets/images/tab_message_n.png'),
    _Item('assets/images/tab_mine_s.png', 'assets/images/tab_home_n.png')
  ];

  List<BottomNavigationBarItem> barItems;
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    if (barItems == null) {
      barItems = items
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(item.normalIcon, width: 32, height: 32),
              title: Container(),
              activeIcon: Image.asset(item.activeIcon, width: 32, height: 32)))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          HomePage(),
          VideoListPage(),
          MessagePage(),
          MinePage()
        ],
        index: _selectIndex,
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.teal,
        items: barItems,
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}
