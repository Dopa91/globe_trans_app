import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/colors.dart';
import 'package:globe_trans_app/features/register_feature/repository/country_class.dart';
import 'package:globe_trans_app/features/register_feature/widgets/country_select.dart';
import 'package:globe_trans_app/features/register_feature/widgets/register_button.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key, required this.repository});
  final DatabaseRepository repository;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedCountry = "Germany"; // Standardland Deutschland
  String? selectedCountryCode; //Landesvorwahl
  bool syncContacts = false; // Schalter für Kontakte synchronisieren
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCountryCode =
        countryCodes[selectedCountry]; // Standardvorwahl für Deutschland
  }

  void _onCountryChanged(String newCountry) {
    setState(() {
      // Aktualisiere die Anzeige des ausgewählten Landes und die Vorwahl des Landes
      selectedCountry = newCountry;
      selectedCountryCode = countryCodes[newCountry]; // Aktualisiere Vorwahl
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Phone",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Bitte wählen Sie Ihre Landesvorwahl und geben Sie Ihre Telefonnummer ein.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              // style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 30),
            // Hier wird der CountrySelect Widget verwendet

            CountrySelect(
              selectedCountry: selectedCountry,
              onCountryChanged: _onCountryChanged,
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(selectedCountryCode ?? "",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => setState(
                          () {}), // hier wird der Eingegebene Nummer weitergegeben und im jeweiligen Screen angezeigt
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your phone number",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: "SFProDisplay",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sync Contacts", style: TextStyle(fontSize: 16)),
                Switch(
                  value: syncContacts,
                  activeColor: const Color.fromARGB(255, 22, 174, 27),
                  inactiveTrackColor: Colors.white,
                  onChanged: (bool newValue) {
                    setState(() {
                      syncContacts = newValue;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            RegisterButton(
              repository: widget.repository,
              phoneNumber: phoneNumberController.text,
              countryCode: countryCodes[selectedCountry]!,
            ),
          ],
        ),
      ),
    );
  }
}
