import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/input_email_field.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/language_dropdown.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/text_name_field.dart';
import 'package:globe_trans_app/features/contact_overview_feature/presentation/contact_overview.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';

import '../repository/country_flag.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required this.repository});
  final DatabaseRepository repository;
  @override
  ContactScreenState createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  String selectedCountryCode = '+49';
  String selectedCountryName = 'Deutschland';
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 218, 220),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Neuer Kontakt",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 205, 218, 220),
        actions: <Widget>[
          GestureDetector(
            onTap: () async {
              // Neuen Kontakt hinzufügen

              await widget.repository.addContact(
                  "${_firstNameController.text} ${_lastNameController.text}",
                  "email",
                  "phoneNumber",
                  "image");
              // Navigation
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactView(
                    repository: widget.repository,
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Center(
                child: Text(
                  "Speichern",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextNameField(
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
            ),
            const SizedBox(height: 32),
            Container(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _phoneNumberController,
                          enabled: false,
                          decoration: const InputDecoration(
                            hintText: "Telefon",
                            hintStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontFamily: "SFProDisplay",
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: Text(
                          selectedCountryName,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontFamily: "SFProDisplay",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.green,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Mobile",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: "SFProDisplay",
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(width: 10),
                      DropdownButton<String>(
                        value: selectedCountryCode,
                        items: countryCodes.keys.map((String code) {
                          return DropdownMenuItem<String>(
                            value: code,
                            child: Row(
                              children: [
                                Text(countryCodes[code]!['flag']!),
                                const SizedBox(width: 10),
                                Text(
                                  code,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: "SFProDisplay",
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newCode) {
                          setState(() {
                            selectedCountryCode = newCode!;
                            selectedCountryName =
                                countryCodes[newCode]!['name']!;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneNumberController,
                          decoration: const InputDecoration(
                            hintText: "Nummer",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "SFProDisplay",
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InputEmailField(
              text: "E-Mail",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 30),
            const LanguageDropdown(text: "Ausgangssprache"),
          ],
        ),
      ),
    );
  }
}
