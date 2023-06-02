import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }

  void loadHadeth() async {
    String loadtext = await rootBundle.loadString("assets/files/ahadeth.txt");
  }
}
