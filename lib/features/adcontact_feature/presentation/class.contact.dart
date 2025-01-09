class Contact {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? image;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.image,
  });

  // @override
  // String toString() {
  //   return 'Contact{name: $name, email: $email, phoneNumber: $phoneNumber, image: $image}';
  // }
}
