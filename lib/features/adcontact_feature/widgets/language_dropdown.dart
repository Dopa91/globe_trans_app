import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/adcontact_feature/repository/country_leangue_select.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String selectedCountryCode = "+49";
  String selectedCountryName = "Deutsch";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 30,
        top: 10,
        bottom: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ausgangssprache wählen",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontFamily: "SFProDisplay",
                fontStyle: FontStyle.italic),
          ),
          const Divider(
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedCountryCode,
            isExpanded: true,
            underline: Container(),
            items: countryCodes.keys.map((String code) {
              return DropdownMenuItem<String>(
                value: code,
                child: Row(
                  children: [
                    Text(
                      countryCodes[code]!["flag"]!,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      countryCodes[code]!["name"]!,
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
                selectedCountryName = countryCodes[newCode]!["name"]!;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return countryCodes.keys.map((String code) {
                return Row(
                  children: [
                    Text(
                      countryCodes[selectedCountryCode]!["flag"]!,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      selectedCountryName,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: "SFProDisplay",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
