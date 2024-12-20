import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 8), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 218, 220),
      //backgroundColor: Colors.blueGrey,

      body: Center(
        child: Image(
            image: AssetImage("assets/gif/Dennis_gif_kleiner.gif"),
            fit: BoxFit.fill),
      ),
    );
  }
}
