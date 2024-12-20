// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/shared/auth_repository.dart';
import 'package:provider/provider.dart';

class SubmitButtonWidget2 extends StatelessWidget {
  final String smsCode;
  const SubmitButtonWidget2.verifyButton({super.key, required this.smsCode});

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = context.read<AuthRepository>();
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
            authRepository.signInWithPhoneNumber(smsCode);
            /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddContactScreen(
                      //repository: repository,
                      )),
            );*/
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
