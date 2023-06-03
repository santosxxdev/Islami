import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/HadethModel.dart';

import '../theme_mode.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethModel> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      loadHadeth();
    }

    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Divider(
          thickness: 2,
          color: ThemeStyle.lightTheme.primaryColor,
        ),
        Text(
          'Ahadeth',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          thickness: 2,
          color: ThemeStyle.lightTheme.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: Theme.of(context).primaryColor,
              indent: 42,
              endIndent: 42,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Text(
                  allHadeth[index].titelHadeth,
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: allHadeth.length,
          ),
        ),
      ],
    );
  }

  void loadHadeth() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((AhadethFile) {
      List<String> ahadethList = AhadethFile.split('#');

      for (int i = 0; i < ahadethList.length; i++) {
        List<String> SingleAhadethlines = ahadethList[i].trim().split('\n');
        String titel = SingleAhadethlines[0];
        SingleAhadethlines.removeAt(0);
        List<String> content = SingleAhadethlines;
        HadethModel hadethModel = HadethModel(titel, content);
        allHadeth.add(hadethModel);
      }

      setState(() {});
    }).catchError((erorr) {
      print(erorr);
    });
  }
}
