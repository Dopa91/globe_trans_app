import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/colors.dart';
import 'package:globe_trans_app/database_repository.dart';
import 'package:globe_trans_app/features/register_feature/repository/country_class.dart';
import 'package:globe_trans_app/features/register_feature/widgets/country_select.dart';
import 'package:globe_trans_app/features/register_feature/widgets/submit_button_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key, required this.repository});
  final DatabaseRepository repository;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedCountry = "Germany"; // Standardland Deutschland
  String? selectedCode;
  bool syncContacts = false; // Schalter für Kontakte synchronisieren

  @override
  void initState() {
    super.initState();
    selectedCode =
        countryCodes[selectedCountry]; // Standardvorwahl für Deutschland
  }

  void _onCountryChanged(String newCountry) {
    setState(() {
      selectedCountry = newCountry;
      selectedCode = countryCodes[newCountry]; // Aktualisiere Vorwahl
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
              "Please confirm your country code and enter your phone number.",
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
                  Text(selectedCode ?? '+49',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
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
            SubmitButtonWidget(
              repository: widget.repository,
            ),
          ],
        ),
      ),
    );
  }
}
