import 'package:flutter/material.dart';
import 'package:sheetsapp/views/home.dart';

void main() {
  runApp(Sheetapp());
}

class Sheetapp extends StatelessWidget {
  const Sheetapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sheet App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: home(),
    );
  }
}
