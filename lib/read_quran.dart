import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/SuraArgs.dart';

class ReadQuran extends StatefulWidget {
  static const String routeName = 'readQuran';

  @override
  State<ReadQuran> createState() => _ReadQuranState();
}

class _ReadQuranState extends State<ReadQuran> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraArgs suraArgs = ModalRoute.of(context)?.settings.arguments as SuraArgs;
    if (verses.isEmpty) {
      loadQuran(suraArgs.index);
    }
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/default_bg.png',
              fit: BoxFit.fill,
            )),
        Scaffold(
            appBar: AppBar(
                title: Text(
              suraArgs.NameSura,
              style: Theme.of(context).textTheme.bodyLarge,
            )),
            body: verses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(verses[index]);
                    },
                    itemCount: verses.length,
                  )),
      ],
    );
  }

  Future<void> loadQuran(int index) async {
    String sura = await rootBundle.loadString("assets/files/$index");

    List<String> lines = sura.split("\n");

    verses = lines;

    setState(() {});
  }
}