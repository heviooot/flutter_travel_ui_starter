import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE), //teal
        accentColor: Color(0xFFD8ECF1), //grew
        scaffoldBackgroundColor: Color(0xFFF3F5F7), //light grey
      ),
      home: HomeScreen(),
    );
  }
}