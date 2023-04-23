import 'package:calculator/calculotr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const calculator(),
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
