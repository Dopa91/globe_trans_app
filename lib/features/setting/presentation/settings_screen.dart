import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/setting/widget/change_mobile_number.dart';
import 'package:globe_trans_app/features/setting/widget/create_profile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isClickOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Einstellungen"),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text("Profil", style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateProfileScreen()),
              );
            },
          ),
          const Divider(color: Colors.green),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white),
            title: const Text("Benachrichtigungen",
                style: TextStyle(color: Colors.white)),
            trailing: Switch(
              value: isClickOn,
              onChanged: (value) {
                setState(() {
                  isClickOn = value;
                });
              },
              activeColor: isClickOn ? Colors.green[800] : Colors.grey,
            ),
          ),
          const Divider(color: Colors.green),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.white),
            title: const Text("Mobilnummer ändern",
                style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangeMobileNumberScreen()),
              );
            },
          ),
          const Divider(color: Colors.green),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.white),
            title: const Text("Sprache", style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              // Hier kommt die Einstellung der Sprache hin
            },
          ),
          const Divider(color: Colors.green),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.white),
            title: const Text("Über", style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              // Hier kommt einm Über Screen hin
            },
          ),
        ],
      ),
    );
  }
}
