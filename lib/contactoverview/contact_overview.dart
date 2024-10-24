import 'package:flutter/material.dart';
import 'package:globe_trans_app/chatOverView/chat_overview_screen.dart';
import 'package:globe_trans_app/config/colors.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Meine Kontakte",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        backgroundColor: backgroundColor,
        scrolledUnderElevation:
            0, // Damit AppBar farbe sich nicht leicht verändert um den BackgroundColor identisch zu behalten
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatView()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                hintText: "Kontakte Suchen",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: "SFProDisplay",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey),
                prefixIcon:
                    const Icon(Icons.search, size: 28, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 35.0),
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
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
                    child: const ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/logo.png'),
                      ),
                      title: Text(
                        "Vorname Nachname",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                      subtitle: Text(
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
          ),
        ],
      ),
    );
  }
}
