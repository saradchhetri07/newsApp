import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      backgroundColor: Colors.white,
      fontFamily: 'Muli',
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
      titleTextStyle: TextStyle(fontSize: 18, color: Color(0XFF8B8B8B)));
}
