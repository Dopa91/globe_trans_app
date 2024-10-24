import 'package:flutter/material.dart';
import 'package:globe_trans_app/mobileInputScreen/code_input_screen.dart';

import '../config/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Titel: "GlobeTrans" mit lebendigeren Farben und mehr Schatten
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Globe", style: myTheme.textTheme.displayLarge),
                Text("Trans", style: myTheme.textTheme.displayMedium),
              ],
            ),
            Text("Message", style: myTheme.textTheme.displaySmall),

            SizedBox(height: 20),
            // Bild
            Image.asset(
              "assets/logo.png",
              height: 200,
            ),
            const SizedBox(height: 20),
            // Untertitel
            const Text(
              "Kommunizieren ohne Sprachbarrieren",
              style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50), // Höhe des Abstands zum Button erhöht
            // Login / Register Button
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent, // Hintergrundfarbe des Containers
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 4), // Position des Schattens
                    blurRadius: 8, // Weichheit des Schattens
                    spreadRadius: 2, // Größe des Schattens
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigation zur Registrierungsseite
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 42, 167, 47),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Login / Register",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
