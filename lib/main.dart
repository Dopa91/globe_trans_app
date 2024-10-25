import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/themes.dart';
import 'package:globe_trans_app/homescreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlobeTransMessage',
      theme: myTheme,
      home: const HomeScreen(),
    );
  }
}
