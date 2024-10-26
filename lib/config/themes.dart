import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  textTheme: const TextTheme(
    // Style für "Globe"
    displayLarge: TextStyle(
      fontSize: 65,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 128, 0), // Dunkleres Grün
      shadows: [
        Shadow(
            blurRadius: 5,
            color: Colors.black,
            offset: Offset(1, 0)), // Schwarze Kontur
        Shadow(
            blurRadius: 5,
            color: Colors.black54,
            offset: Offset(8, 2)), // Milder Schatten
        Shadow(blurRadius: 8, color: Colors.black38, offset: Offset(4, 4)),
      ],
    ),

    //Style für "Trans"
    displayMedium: TextStyle(
      fontSize: 65,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 56, 176, 0), // Noch helleres Grün
      shadows: [
        Shadow(
            blurRadius: 5,
            color: Colors.black,
            offset: Offset(1, 0)), // Schwarze Kontur
        Shadow(
            blurRadius: 5,
            color: Colors.black54,
            offset: Offset(8, 2)), // Milder Schatten
        Shadow(blurRadius: 8, color: Colors.black38, offset: Offset(4, 4)),
      ],
    ),
    // Style für  "Message"
    displaySmall: TextStyle(
      fontSize: 65,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 112, 224, 0), // Sehr helles Grün
      shadows: [
        Shadow(
            blurRadius: 5,
            color: Colors.black54,
            offset: Offset(8, 2)), // Milder Schatten
        Shadow(blurRadius: 8, color: Colors.black38, offset: Offset(4, 4)),
      ],
    ),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 205, 218, 220),
  fontFamily: "SFProDisplay",
);
