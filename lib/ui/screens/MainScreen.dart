import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takemo_app/bloc/AppBloc.dart';
import 'package:takemo_app/ui/pageviews/Blue.dart';
import 'package:takemo_app/ui/pageviews/Red.dart';
import 'package:takemo_app/ui/pageviews/homepage/HomeTabPage.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    print("MainScreen init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("MainScreen build");

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xFF272727), //or set color with: Color(0xFF0000FF)
    ));

    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      body: HomeTabPage(),
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

  @override
  void dispose() {
    super.dispose();
    AppBloc.appBloc.dispose();
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
