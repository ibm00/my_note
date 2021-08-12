import 'package:flutter/material.dart';

ThemeData myTheme() {
  return ThemeData(
    primaryColor: Color(0xFF252525),
    accentColor: Color(0xFF3B3B3B),
    fontFamily: 'UbuntuMono',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 35),
      subtitle1: TextStyle(fontSize: 24),
    ),
    // appBarTheme: AppBarTheme(
    //   textTheme: TextTheme(
    //     subtitle1: TextStyle(fontSize: 24),
    //   ),
    // ),
  );
}
