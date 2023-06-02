import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      loadSura(suraArgs.index);
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
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      color: Theme.of(context).primaryColor,
                      indent: 42,
                      endIndent: 42,
                    ),
                    itemBuilder: (context, index) {
                      return Text(
                        verses[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.elMessiri(
                            fontSize: 18, color: Colors.black54),
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadSura(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    print(lines);
    verses = lines;
    setState(() {});
  }
}
