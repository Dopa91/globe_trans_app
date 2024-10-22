import 'package:flutter/material.dart';
import 'package:globe_trans_app/models/country_class.dart';

class CountrySelect extends StatefulWidget {
  final String selectedCountry;
  final ValueChanged<String> onCountryChanged; // Callback für geändertes Land

  const CountrySelect({
    super.key,
    required this.selectedCountry,
    required this.onCountryChanged, // Funktion wird hier übergeben
  });

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        value: widget.selectedCountry, // Wert vom übergeordneten Widget
        items: countryCodes.keys.map((String country) {
          return DropdownMenuItem<String>(
            value: country,
            child: Row(
              children: [
                Image.asset(
                  countryFlags[country]!,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Text(country),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            widget.onCountryChanged(newValue); // Callback aufrufen
          }
        },
      ),
    );
  }
}
