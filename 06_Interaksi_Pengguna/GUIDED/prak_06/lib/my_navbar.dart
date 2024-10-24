import 'package:flutter/material.dart';
import 'package:prak_06/my_package.dart';
import 'package:prak_06/my_tabbar.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyNavbar> {
  int _selectIndex = 0;
  void _onTappedItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    MyTabbar(),
    MyPackage(),
    MyPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation Bar"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: _pages[_selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_max_rounded),
              label: "My Tabbar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.adb_rounded),
              label: "My Package 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_rounded),
              label: "My package 2",
            ),
          ],
          selectedItemColor: Colors.amber,
          currentIndex: _selectIndex,
          onTap: _onTappedItem,
          selectedFontSize: 20,
        ));
  }
}
