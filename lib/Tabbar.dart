import 'package:flutter/material.dart';

class TabBarTest extends StatefulWidget {

  @override
  _TabBarTestState createState() => _TabBarTestState();
}

class _TabBarTestState extends State<TabBarTest> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Room: 611 ", style: TextStyle(color: Colors.black26),),
                Text("GUEST: Hòa", style: TextStyle(color: Colors.black26),)
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "History",
                  style: TextStyle(color: Colors.black26, fontSize: 14),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          labelColor: Colors.black87,
          tabs: [
            Tab(
              child: Text("CALLS"),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("CONTACTS"),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("CONTACTS"),
            ),
          ],
          controller: _tabController,
          indicatorColor: Color(0xff489BB3),
          isScrollable: true,
        ),
        bottomOpacity: 1,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff489BB3),
        selectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home, size: 30,
              ),
              title: Text('Trang chủ')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps, size: 30,
              ),
              title: Text('Danh mục')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications, size: 30,
              ),
              title: Text('Thông báo')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person, size: 30,
              ),
              title: Text('Tài khoản')
          )
        ],
      ),
      body: TabBarView(
        children: [
          Center(child: Text("Call Tab Bar View")),
          Center(child: Text("Chats Tab Bar View")),
          Center(child: Text("Contacts Tab Bar View")),
          Center(child: Text("Chats Tab Bar View")),
          Center(child: Text("Contacts Tab Bar View")),
        ],
        controller: _tabController,
      ),
    );
  }
}

