import 'package:flutter/material.dart';
import 'package:takemo_app/ui/home/HomeAppBar.dart';

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
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              left: true,
              top: true,
              right: true,
              bottom: true,
              child: Column(
                children: <Widget>[
                  HomeAppBar(
                    height: MediaQuery.of(context).size.height,
                  ),
                  Text('Hello, world!'),
                  Container(
                    height: 150,
                  ),
                  Text('Hello, world!'),
                  Container(
                    height: 150,
                  ),
                  Text('Hello, world!'),
                  Container(
                    height: 150,
                  ),
                  Text('Hello, world!'),
                  Container(
                    height: 150,
                  ),
                  Text('Hello, world!'),
                  Container(
                    height: 300,
                  ),
                ],
              ))),
      bottomNavigationBar: BottomNavigationBar(
//        onTap: onTabTapped, // new
//        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}
