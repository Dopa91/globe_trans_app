import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/class.contact.dart';

class TextNameField extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final Contact? contact;
  //final String hintText;

  const TextNameField({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    this.contact,
    //required this.hintText});
  });

  @override
  Widget build(BuildContext context) {
    if (contact != null) {
      firstNameController.text = contact!.firstName;
      lastNameController.text = contact!.lastName;
    }

    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 30,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: firstNameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "Vorname",
              hintStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontFamily: "SFProDisplay",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
              border: InputBorder.none,
            ),
          ),
          const Divider(
            color: Colors.green,
          ),
          TextFormField(
            controller: lastNameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "Nachname",
              hintStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontFamily: "SFProDisplay",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
