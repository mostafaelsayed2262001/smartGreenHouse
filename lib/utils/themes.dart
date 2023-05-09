import 'package:flutter/material.dart';

const Color mainColor = Colors.green;
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor = Colors.grey;


class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    appBarTheme: AppBarTheme(color: mainColor),
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
