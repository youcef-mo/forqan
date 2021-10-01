import 'package:flutter/material.dart';
import 'package:forqan/screens.dart/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forqan',
      theme: ThemeData(
        primaryColor: Colors.cyanAccent,
      ),
      home: HomeScreen(),
    );
  }
}
