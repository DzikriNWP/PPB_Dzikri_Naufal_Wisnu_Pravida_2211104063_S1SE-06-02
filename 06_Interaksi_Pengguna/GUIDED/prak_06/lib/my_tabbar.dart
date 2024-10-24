import 'package:flutter/material.dart';

class MyTabbar extends StatefulWidget {
  const MyTabbar({super.key});

  @override
  State<MyTabbar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("menu Tab Bar"),
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.food_bank),
                  text: "Menu",
                ),
                Tab(
                  icon: Icon(Icons.calendar_month),
                  text: "Calender",
                ),
                Tab(
                  icon: Icon(Icons.history),
                  text: "History",
                )
              ]),
              backgroundColor: Colors.amberAccent,
            ),
            body: const TabBarView(children: [
              Center(
                child: Text("ini konten menu"),
              ),
              Center(
                child: Text("ini konten Calender"),
              ),
              Center(
                child: Text("ini konten History"),
              )
            ])));
  }
}
