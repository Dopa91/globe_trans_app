import 'package:flutter/material.dart';
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
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 205, 218, 220),
          fontFamily: "SFProDisplay"),
      home: const HomeScreen(),
    );
  }
}
