import 'package:flutter/material.dart';
import './injections.dart' as di;

Future<void> main() async {
  // initialize dependencies injections
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce DDD',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.amberAccent,
      ),
      home: const Text('Flutter Architecture inspired by Domain Driven Design'),
    );
  }
}
