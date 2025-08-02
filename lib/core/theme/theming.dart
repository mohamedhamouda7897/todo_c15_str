import 'package:flutter/material.dart';
import 'package:todo_c15_str/core/colors/light_colors.dart';
import 'package:todo_c15_str/core/colors/main_colors.dart';

final MainColors colors = LightColors();

class AppTheming {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blue.shade50,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade50,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),

    textTheme: TextTheme(),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: colors.error200,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade50,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),

    textTheme: TextTheme(),
  );
}
