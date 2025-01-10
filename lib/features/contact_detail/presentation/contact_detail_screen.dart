import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/class.contact.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/input_email_field.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/language_dropdown.dart';
import 'package:globe_trans_app/features/adcontact_feature/widgets/text_name_field.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:provider/provider.dart';

import '../../adcontact_feature/repository/country_flag.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({super.key, required this.contact});
  final Contact contact;

  @override
  ContactDetailScreenState createState() => ContactDetailScreenState();
}

class ContactDetailScreenState extends State<ContactDetailScreen> {
  String selectedCountryCode = '+49';
  String selectedCountryName = 'Deutschland';
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialisiere die Controller mit den bestehenden Kontaktdaten
    _firstNameController.text = widget.contact.firstName;
    _lastNameController.text = widget.contact.lastName;
    _emailController.text = widget.contact.email;

    // Extrahiere Ländervorwahl und Nummer aus der Telefonnummer
    if (widget.contact.phoneNumber.isNotEmpty) {
      final phoneComponents = widget.contact.phoneNumber.split(' ');
      if (phoneComponents.length > 1) {
        selectedCountryCode = phoneComponents[0];
        _phoneNumberController.text = phoneComponents[1];
        // Aktualisiere den Ländernamen basierend auf der Vorwahl
        selectedCountryName =
            countryCodes[selectedCountryCode]?['name'] ?? 'Deutschland';
      }
    }
  }

  @override
  void dispose() {
    // Gebe die Controller frei
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bitte geben Sie Vor- und Nachnamen ein'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    if (_phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bitte geben Sie eine Telefonnummer ein'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> _saveContact() async {
    if (!_validateForm()) return;

    try {
      await context.read<DatabaseRepository>().addContact(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          "$selectedCountryCode ${_phoneNumberController.text}",
          "image");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kontakt wurde erfolgreich gespeichert'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fehler beim Speichern: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
            onTap: _saveContact,
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              TextNameField(
                contact: widget.contact,
                firstNameController: _firstNameController,
                lastNameController: _lastNameController,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                            keyboardType: TextInputType.phone,
                            controller: _phoneNumberController,
                            decoration: const InputDecoration(
                              hintText: "Telefonnummer",
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
              const SizedBox(height: 30),
              InputEmailField(
                text: "E-Mail",
                controller: _emailController,
              ),
              const SizedBox(height: 30),
              const LanguageDropdown(text: "Ausgangssprache"),
            ],
          ),
        ),
      ),
    );
  }
}
