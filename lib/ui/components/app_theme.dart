import 'package:flutter/material.dart';

class MakeThemeData {
  static const Color primaryColor = Color(0xFFFF6230);
  static const Color primaryColorDark = Color(0xFFEB5A2D);
  static const Color primaryColorLight = Color(0xFFFF8B37);

  static const Color secundaryColor = Color(0xFF141414);
  static const Color secundaryColorDark = Color(0xFF0F0E0E);
  static const Color secundaryColorLight = Color(0xFF242424);

  static const Color whiteColor = Color(0xFFffffff);
  static const Color whiteColorLight = Color(0xFFF8FAFF);
  static const Color whiteColorDark = Color(0xFFEDE8E8);

  static const Color successColor = Color(0xFF61E16E);
  static const Color dangerColor = Color(0xFFFF5A5A);
  static const Color warningColor = Color(0xFFffce00);

  static ThemeData makeAppTheme() {
    const fontBstage = 'Lato-Regular';

    const textTheme = TextTheme(
      headline2: TextStyle(
        color: secundaryColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        // fontFamily: 'Gotham-Medium',
      ),

      // title appbar
      headline3: TextStyle(
        color: whiteColorLight,
        fontSize: 28,
      ),
      // TabTitle
      headline4: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      // Event name on Event Card
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      headline6: TextStyle(
        fontSize: 18,
        color: MakeThemeData.secundaryColorLight,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: whiteColor,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: secundaryColorLight,
      ),
    );

    return ThemeData(
      fontFamily: fontBstage,
      textTheme: textTheme,
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,

      // colorScheme: ColorScheme(
      //   primary: primaryColor,
      //   primaryVariant: primaryColorDark,
      //   background: whiteColorDark,
      //   brightness: Brightness.light,
      //   error: dangerColor,

      // ),
      // hintColor: orangeColor,
      brightness: Brightness.light,
      primarySwatch: Colors.deepOrange,
    );
  }
}
