import 'package:flutter/material.dart';

import 'style.dart';

class BstageTheme {
  BstageTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Lato-Regular",
    brightness: Brightness.dark,
    primarySwatch: Colors.deepOrange,
    primaryColor: lightColor,
    selectedRowColor: orangeColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 10,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: "Lato-Regular",
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    primaryColor: darkColor,
    hintColor: Colors.orange,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 48,
      ),
      headline6: TextStyle(
        fontSize: 19,
        color: mediumColor,
      ),
    ),
  );
}

class BstageNeumorphicTheme {
  final List<BoxShadow>? outerShadow;
  final List<Color>? innerShadowColors;
  final Color? borderColor;
  final Color? buttonColor;
  final bool? isDark;
  BstageNeumorphicTheme({
    this.outerShadow,
    this.innerShadowColors,
    this.borderColor,
    this.buttonColor,
    this.isDark = false,
  });
}
