import 'package:flutter/material.dart';
import 'package:swipe_esm/award/AwardHome.dart';
import 'package:swipe_esm/esm/EsmHome.dart';
import 'package:swipe_esm/other/OtherHome.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  int _currentIndex = 1;
  final List _children = [AwardHome(), EsmHome(), OtherHome()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app"),
      ),
      body: Container(
        child: _children[_currentIndex],
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                  size: 40,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 40,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 40,
                ),
                label: "")
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() => {_currentIndex = index});
  }
}
