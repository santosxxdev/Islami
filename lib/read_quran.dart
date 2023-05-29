import 'package:flutter/material.dart';
import 'package:islami/SuraArgs.dart';

class ReadQuran extends StatelessWidget {
  static const String routeName = 'readQuran';

  @override
  Widget build(BuildContext context) {
    SuraArgs suraArgs = ModalRoute.of(context)?.settings.arguments as SuraArgs;

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
            style: Theme.of(context).textTheme.bodyMedium,
          )),
          body: Container(),
        ),
      ],
    );
  }
}
