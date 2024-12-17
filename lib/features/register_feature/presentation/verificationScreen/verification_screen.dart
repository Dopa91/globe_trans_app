import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/register_feature/widgets/verify_button.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen(
      {super.key, required this.phoneNumber, required this.countryCode});

  final String phoneNumber;
  final String countryCode;

  @override
  VerificationScreenState createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController phoneNumbercontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneNumbercontroller.dispose();
    super.dispose();
  }

  void _resendVerificationCode(String phoneNumber) {
    context.read<DatabaseRepository>();
    (phoneNumber);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification Code Gesendet')),
    );
  }

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
            Text(
              "Wir haben Ihnen eine SMS mit dem Code an ${widget.countryCode} ${widget.phoneNumber} gesendet.",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCodeBox(),
                buildCodeBox(),
                buildCodeBox(),
                buildCodeBox(),
                buildCodeBox(),
                buildCodeBox(),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _resendVerificationCode("phoneNumber");
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
            const SubmitButtonWidget2.verifyButton(),
          ],
        ),
      ),
    );
  }

  Widget buildCodeBox() {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}
