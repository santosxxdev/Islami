import 'package:flutter/material.dart';
import 'package:islami/taps/hadeth.dart';
import 'package:islami/taps/quran.dart';
import 'package:islami/taps/radio.dart';
import 'package:islami/taps/sebha.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> taps = [
    RadioScreen(),
    SebhaScreen(),
    HadethScreen(),
    QuranScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: Image.asset(
            'assets/images/default_bg.png',
            fit: BoxFit.fill,
          )),
      Scaffold(
        appBar: AppBar(
          title: Text(
            'Islami',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
        ),
        body: taps[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: 'radio',
                backgroundColor: Theme.of(context).backgroundColor),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: 'sebha',
                backgroundColor: Theme.of(context).backgroundColor),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                label: 'hadeth',
                backgroundColor: Theme.of(context).backgroundColor),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                label: 'quran',
                backgroundColor: Theme.of(context).backgroundColor),
          ],
          onTap: (value) {
            index = value;
            setState(() {});
          },
        ),
      ),
    ]);
  }
}
