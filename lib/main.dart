import 'package:flutter/material.dart';
import 'package:islami/read_quran.dart';
import 'package:islami/theme_mode.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyle.lightTheme,
      darkTheme: ThemeStyle.lightTheme,
      routes: {
        Home.routeName: (context) => Home(),
        ReadQuran.routeName: (context) => ReadQuran(),
      },
      initialRoute: Home.routeName,
    );
  }
}
