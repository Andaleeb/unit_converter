import 'package:flutter/material.dart';
import 'package:unit_converter/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.purple  ,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.blue, fontSize: 25)
        ),
      ),
      home: HomeScreen(),
    );
  }
}

