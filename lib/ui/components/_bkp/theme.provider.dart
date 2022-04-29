// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class BstageThemeProvider extends ChangeNotifier {
//   BstageThemeProvider() {
//     load();
//   }

//   bool isDarkMode = false;

//   void updateTheme(bool isDarkMode) {
//     this.isDarkMode = isDarkMode;
//     notifyListeners();
//   }

//   // void load() async {
//   //   var prefs = await SharedPreferences.getInstance();
//   //   var theme = prefs.getString(THEME);
//   //   isDarkMode = theme == null ? false : true;
//   //   notifyListeners();
//   // }

//   Color contentTabBackgroudColor(context) {
//     return isDarkMode == true ? darkColor.withOpacity(.8) : Colors.grey[200];
//   }

//   Color roundedTabBackgroudColor(context) {
//     return isDarkMode == true ? darkColor : whiteColor;
//   }
// }
