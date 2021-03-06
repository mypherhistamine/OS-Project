import './congo.dart';
import './conversion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/congoPage': (context) => Congo(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Conversion(),
    );
  }
}
