import 'package:flutter/material.dart';
import 'package:takemo_app/ui/screens/MainScreen.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'My app',
        theme: ThemeData(
          primaryColor: Color(0xFF272727),
          primaryColorDark: Colors.black,
          accentColor: Color(0xff262626),
//          accentColorBrightness: Brightness.dark
        ),
        home: MainScreen()),
  );
}
