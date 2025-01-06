import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/adcontact_feature/repository/country_flag.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/input_email_field.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/language_dropdown.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/text_name_field.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:provider/provider.dart';
import '../../adcontact_feature/presentation/class.contact.dart';

class ContactDetailScreen extends StatefulWidget {
  final Contact contact; // Füge die Kontakt-Referenz hinzu

  const ContactDetailScreen({super.key, required this.contact});

  @override
  ContactDetailScreenState createState() => ContactDetailScreenState();
}

class ContactDetailScreenState extends State<ContactDetailScreen> {
  String selectedCountryCode = '+49';
  String selectedCountryName = 'Deutschland';
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    // Initialisiere die Controller mit den Werten des übergebenen Kontakts
    _firstNameController =
        TextEditingController(text: widget.contact.name.split(' ')[0]);
    _lastNameController =
        TextEditingController(text: widget.contact.name.split(' ')[1]);
    _phoneNumberController =
        TextEditingController(text: widget.contact.phoneNumber);
    _emailController = TextEditingController(text: widget.contact.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 218, 220),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Kontakt Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 205, 218, 220),
        actions: <Widget>[
          GestureDetector(
            onTap: () async {
              try {
                // Kontakt aktualisieren (nur Beispiel)
                await context.read<DatabaseRepository>().updateContact(
                      widget.contact.id,
                      "${_firstNameController.text} ${_lastNameController.text}",
                      _emailController.text,
                      _phoneNumberController.text,
                    );
                setState(() {
                  widget.contact.name =
                      "${_firstNameController.text} ${_lastNameController.text}";
                  widget.contact.email = _emailController.text;
                  widget.contact.phoneNumber = _phoneNumberController.text;
                });
                // Bestätigungsmeldung anzeigen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Änderungen gespeichert'),
                  ),
                );
              } catch (e) {
                // Fehlerbehandlung
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Fehler beim Speichern: $e'),
                  ),
                );
              }
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
                          enabled:
                              true, // Hier kannst du das Feld editierbar machen
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
                        padding: const EdgeInsets.only(right: 100),
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
              controller: _emailController,
              phoneController:
                  _phoneNumberController, // Verwende den Controller hier
            ),
            const SizedBox(height: 30),
            const LanguageDropdown(text: "Ausgangssprache"),
          ],
        ),
      ),
    );
  }
}
