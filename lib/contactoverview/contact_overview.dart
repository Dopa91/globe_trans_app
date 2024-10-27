import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:globe_trans_app/chatOverView/chat_overview_screen.dart';
import 'package:globe_trans_app/config/colors.dart';
import 'dart:math';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  int selectedPage = 0;

  final List<String> names = [
    "Mert Samed Durmus",
    "Melek Durmus",
    "Direnc Durmus",
    "Ismail Karaaslan",
    "Yeliz Orhan",
    "Serkan Durmus",
    "Nezahat Karaaslan",
    "Nadine Karaaslan",
    "Yvon Karaaslan",
    "Muharrem Karaaslan",
  ];

  final List<Widget> _pageOptions = [
    const ContactView(), // Kontakte Seite
    ChatView(), // Chat Seite
    const Placeholder(), // Platzhalter für andere Seite
  ];

  String getAppBarTitle() {
    switch (selectedPage) {
      case 0:
        return "Meine Kontakte";
      case 1:
        return "Chat Übersicht";
      default:
        return "Home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          getAppBarTitle(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
      ),
      body: selectedPage == 0
          ? Column(
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
                      prefixIcon: const Icon(Icons.search,
                          size: 28, color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: names.length, // Die Anzahl der Namen
                    itemBuilder: (context, index) {
                      // Zufällige Auswahl eines Namens
                      String contactName =
                          names[Random().nextInt(names.length)];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 35.0),
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
                            leading: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/logo.png'),
                            ),
                            title: Text(
                              contactName, // Zufälliger Name
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
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
                ),
              ],
            )
          : _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: buttonColor,
        color: Colors.white,
        activeColor: Colors.white,
        items: const [
          TabItem(icon: Icons.contact_page, title: 'Kontakte'),
          TabItem(icon: Icons.chat, title: 'Chats'),
          TabItem(icon: Icons.settings, title: 'Einstellungen'),
        ],
        initialActiveIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index; // Wechselt die Seite bei Tab-Navigatio
          });
        },
      ),
    );
  }
}
