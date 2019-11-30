import 'package:flutter/material.dart';
import 'package:takemo_app/ui/screens/MainScreen.dart';

void main() {
  runApp(MaterialApp(
      title: 'My app',
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorDark: Colors.black26,
          accentColor: Colors.grey,
          accentColorBrightness: Brightness.dark
      ),
      home: MainScreen()),
  );
}
