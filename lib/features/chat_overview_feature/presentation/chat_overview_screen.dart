import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/colors.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/class.contact.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(color: Colors.green),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  storyItem("assets/statusfoto.jpg", "Mein Status"),
                  storyItem("assets/mertkontaktfoto.jpeg", "Mert "),
                  storyItem("assets/melekkontaktfoto.jpeg", "Melek "),
                  storyItem("assets/direnckontaktfoto.jpeg", "Direnc"),
                  storyItem('assets/logo.png', 'Iso'),
                  storyItem("assets/yelizkontaktfoto.jpeg", "Yeliz"),
                ],
              ),
              const Divider(color: Colors.green),
              Expanded(
                child: FutureBuilder<List<Contact>>(
                  future: context
                      .read<DatabaseRepository>()
                      .getChatContacts(), // Changed this line
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(
                          child: Text("Fehler beim Laden der Kontakte"));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text("Keine Kontakte vorhanden"));
                    }

                    final contacts = snapshot.data!;

                    return ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        final contact = contacts[index];
                        final contactName =
                            "${contact.firstName} ${contact.lastName}";

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 35.0),
                          child: Container(
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
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        ChatScreen(
                                      contactName: contactName,
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              leading: const CircleAvatar(
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              title: Text(contactName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              subtitle: const Text("Letzte Nachricht",
                                  style: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget storyItem(String imagePath, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
