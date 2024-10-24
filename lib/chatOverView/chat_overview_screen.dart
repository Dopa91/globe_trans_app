import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/colors.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 35.0),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(179, 255, 255, 255),
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: const Text(
                  "Vorname Nachname",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black),
                ),
                subtitle: const Text(
                  "Online",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}