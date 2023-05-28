import 'package:flutter/material.dart';
import 'package:islami/SuraArgs.dart';

class ReadQuran extends StatelessWidget {
  static const String routeName = 'readQuran';

  @override
  Widget build(BuildContext context) {
    SuraArgs suraArgs = ModalRoute.of(context)?.settings.arguments as SuraArgs;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        suraArgs.NameSura,
        style: Theme.of(context).textTheme.bodyMedium,
      )),
      body: Container(),
    );
  }
}
