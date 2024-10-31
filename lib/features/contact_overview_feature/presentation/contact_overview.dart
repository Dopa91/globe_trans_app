import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/colors.dart';
import 'package:globe_trans_app/features/chat_overview_feature/presentation/chat_overview_screen.dart';
import 'package:globe_trans_app/features/shared/name_repo.dart';
import 'package:globe_trans_app/presentation/contactScreen/ad_contact.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  int selectedPage = 0;

  final List<Widget> _pageOptions = [
    const ContactView(), // Kontakte Seite
    const ChatView(), // Chat Seite
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

  void _addNewContact() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ContactScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Deaktieviert den Back Icon Nicht vergessen ist Wichtig
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
        actions: selectedPage == 0 // Zeige das Icon nur auf der Kontakte-Seite
            ? [
                IconButton(
                  padding: const EdgeInsets.only(right: 35.0),
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: _addNewContact,
                ),
              ]
            : null, // Keine Aktionen auf anderen Seiten / Das darf ich nicht Vergessen wenn ich nächstes mal ein neues Icon hinzufüge das es auf der Nächsten Seite kein Funktion haben darf
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
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      String contactName = names[index];
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
                              contactName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
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
            selectedPage = index;
          });
        },
      ),
    );
  }
}