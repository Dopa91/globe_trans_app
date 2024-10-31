// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/ad_contact_screen.dart';
import 'package:globe_trans_app/presentation/contactScreen/ad_contact.dart';

class SubmitButtonWidget2 extends StatelessWidget {
  const SubmitButtonWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactScreen()),
            );
          },
          child: const Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
