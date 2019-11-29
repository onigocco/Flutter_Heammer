import 'package:flutter/material.dart';
import 'package:heammer/pages/AudioRoomListPage.dart';
import 'package:heammer/pages/UserListPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Tab> tabs = [Tab(text: 'Audio Party'), Tab(text: 'User List')];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(44),
          child: AppBar(
              centerTitle: false,
              brightness: Brightness.dark,
              flexibleSpace: ConstrainedBox(
                  child: Image(
                    image: AssetImage('assets/images/appbar_backgoung.png'),
                    fit: BoxFit.cover,
                  ),
                  constraints: new BoxConstraints.expand(),
                ),
              title: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(style: BorderStyle.solid, width: 4, color: Color.fromARGB(255, 255, 233, 84))),
                  tabs: tabs,
                  controller: _controller))),
      body: Container(
        child: TabBarView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            children: [AudioRoomListPage(), UserListPage()]),
      ),
    );
  }
}
