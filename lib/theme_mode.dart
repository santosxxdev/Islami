import 'package:flutter/material.dart';

class ThemeStyle {
  static const Color lightColor = Color(0xFFB7935F);
  static ThemeData lightTheme = ThemeData(
      primaryColor: Color(0xFFB7935F),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: lightColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: lightColor),
          bodySmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0.0,
      ));
}
