import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/HomeAppBar.dart';

class HomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HomeAppBar(
                  height: MediaQuery.of(context).size.height,
                ),
              ],
            )));
  }
}
