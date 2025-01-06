class Contact {
  final String id; // Füge eine ID hinzu
  late final String name;
  late final String email;
  late final String phoneNumber;
  final String? image;

  Contact({
    required this.id, // ID muss beim Erstellen des Kontaktobjekts übergeben werden
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.image,
  });

  // @override
  // String toString() {
  //   return 'Contact{name: $name, email: $email, phoneNumber: $phoneNumber, image: $image}';
  // }
}
