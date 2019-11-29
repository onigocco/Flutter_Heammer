import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:heammer/pages/MemberPage.dart';
import 'package:heammer/pages/NewUserPage.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPage createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Tab> tabs = [Tab(text: 'New User'), Tab(text: 'Member')];

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
          preferredSize: Size.fromHeight(50),
          child: AppBar(
              title: TabBar(
                  isScrollable: false,
                  labelColor: Color.fromARGB(255, 147, 84, 238),
                  unselectedLabelColor: Color.fromARGB(255, 153, 153, 153),
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  indicatorSize: TabBarIndicatorSize.label,
                  // indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
                  indicator: BubbleTabIndicator(
                      indicatorColor: Color.fromARGB(255, 241, 230, 255),
                      tabBarIndicatorSize: TabBarIndicatorSize.label,
                      indicatorHeight: 30,
                      padding: EdgeInsets.symmetric(horizontal: 20)),
                  tabs: tabs,
                  controller: _controller))),
      body: Container(
        child: TabBarView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            children: [NewUserPage(), MemberPage()]),
      ),
    );
  }
}
