import 'package:flutter/material.dart';

class TextContainerInput extends StatelessWidget {
  const TextContainerInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
