// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/add_contact_screen.dart';

class SubmitButtonWidget2 extends StatelessWidget {
  const SubmitButtonWidget2.verifyButton({
    super.key,
  });

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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddContactScreen(
                      //repository: repository,
                      )),
            );
          },
          child: const Text(
            "Verify Now",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
