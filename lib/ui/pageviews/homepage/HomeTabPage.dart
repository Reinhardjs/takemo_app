import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/ui/pageviews/homepage/ProductListWidget.dart';
import 'package:takemo_app/ui/widgets/homewidgets//HomeAppBar.dart';

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
                ProductListWidget(),
              ],
            )));
  }
}
