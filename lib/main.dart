import 'package:flutter/material.dart';
import 'package:takemo_app/ui/tabpages/Blue.dart';
import 'package:takemo_app/ui/tabpages/HomeTabPage.dart';
import 'package:takemo_app/ui/tabpages/Red.dart';

import 'model/Product.dart';

void main() {
  runApp(MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: MyScaffold()));
}

class MyScaffold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyScaffoldState();
  }
}

class _MyScaffoldState extends State<MyScaffold> {
  int bottomSelectedIndex = 0;
  final items = Product.getProducts();

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notification'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeTabPage(),
        Red(),
        Blue(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
