import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/SuraArgs.dart';
import 'package:islami/theme_mode.dart';

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
              : Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: ThemeStyle.lightColor)),
                  margin: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(verses[index]);
                    },
                    itemCount: verses.length,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadQuran(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> lines = sura.split("\n");
    print(lines);
    verses = lines;

    setState(() {});
  }
}
