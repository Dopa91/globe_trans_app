// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/register_feature/presentation/verificationScreen/verification_screen.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.phoneNumber,
    required this.countryCode,
    required this.onPressed,
  });

  final String phoneNumber;
  final String countryCode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 22, 174, 27),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 10,
          ),
          onPressed: () {
            onPressed();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VerificationScreen(
                        phoneNumber: phoneNumber,
                        countryCode: countryCode,
                      )),
            );
          },
          child: const Text(
            "Register Now",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
