import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const Color orangeColor = Color(0xFFFF6130);
  const Color orangeDarkColor = Color(0xFFb24321);
  const Color orangeLightColor = Color(0xFFFF8B37);
  const Color whiteColor = Color(0xFFffffff);
  const Color lightColor = Color(0xFFf1f1f1);
  const Color lightSoftColor = Color(0xFFf0f0f0);
  const Color blackColor = Color(0xFF323232);
  const Color darkColor = Color(0xFF181818);
  const Color successColor = Color(0xFF10dc60);
  const Color warningColor = Color(0xFFffce00);
  const Color dangerColor = Color(0xFFf04141);
  const Color mediumColor = Color(0xFF989aa2);

  const Color brownColor = Color(0xFFFFC517);
  const Color brownDarkColor = Color(0xFFFF9724);
  final Color searchFieldColor = const Color(0xFFE4E7EE).withOpacity(0.5);

  const fontBstage = 'Lato-Regular';
  const fontBold = 'Lato-Bold';
  const fontLight = 'Lato-Light';

  const textTheme = TextTheme(
    // TabTitle
    headline4: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: orangeColor,
    ),
    // Event name on Event Card
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: whiteColor,
    ),
    caption: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: whiteColor,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: mediumColor,
    ),
  );

  return ThemeData(
    fontFamily: fontBstage,
    textTheme: textTheme,
    primaryColor: orangeColor,
    // hintColor: orangeColor,
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
  );
}
