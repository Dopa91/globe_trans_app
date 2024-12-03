import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/colors.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:globe_trans_app/features/shared/name_repo.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.repository});

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          const Divider(color: Colors.green),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              storyItem("assets/statusfoto.jpg", "Mein Status"),
              storyItem("assets/mertkontaktfoto.jpeg", "Mert"),
              storyItem("assets/melekkontaktfoto.jpeg", "Melek"),
              storyItem("assets/direnckontaktfoto.jpeg", "Direnc"),
              storyItem('assets/logo.png', 'Iso'),
              storyItem("assets/yelizkontaktfoto.jpeg", "Yeliz"),
            ],
          ),
          const Divider(color: Colors.green),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                String contactName = names[index]; //

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
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ChatScreen(
                              contactName: contactName,
                              repository: repository,
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

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
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text("Letzte Nachricht",
                          style: TextStyle(color: Colors.grey)),
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
