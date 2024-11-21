import 'package:flutter/material.dart';
import 'package:globe_trans_app/database_repository.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/ad_contact_screen.dart';
import 'package:globe_trans_app/features/register_feature/widgets/submit_button_widget_2.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.repository});
  final DatabaseRepository repository;

  @override
  VerificationScreenState createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 218, 220),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 205, 218, 220),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Enter Code",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "We have sent you an SMS with the code to +49 xxx xxx xxx",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCodeBox(""),
                buildCodeBox(""),
                buildCodeBox(""),
                buildCodeBox(""),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactScreen(
                      repository: widget.repository,
                    ),
                  ),
                );
              },
              child: const Text(
                "Resend Code ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 40),
            SubmitButtonWidget2(
              repository: widget.repository,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeBox(String boxCode) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Text(
        boxCode,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
