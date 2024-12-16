import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/class.contact.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseDatabaseRepository implements DatabaseRepository {
  @override
  Future<void> addContact(
      String name, String email, String phoneNumber, String image) async {
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('contacts').add({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'image': image,
    });
  }

  @override
  Future<void> createChat(Message message, String receiver) {
    // TODO: implement createChat
    throw UnimplementedError();
  }

  @override
  Future<void> deleteContact(Contact contact) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMessage(Message message) {
    // TODO: implement deleteMessage
    throw UnimplementedError();
  }

  @override
  Future<List<Chat>> getAllChats() {
    // TODO: implement getAllChats
    throw UnimplementedError();
  }

  @override
  Future<List<Message>> getAllMessages() {
    // TODO: implement getAllMessages
    throw UnimplementedError();
  }

  @override
  Future<void> getContact(Contact contact) async {
    // TODO: implement getContact
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getContactList() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('contacts').get();
    return snapshot.docs
        .map((doc) => Contact(
              name: doc['name'],
              email: doc['email'],
              phoneNumber: doc['phoneNumber'],
              image: doc['image'],
            ))
        .toList();
  }

  @override
  Future<void> newGroupChat(List<Message> messages) {
    // TODO: implement newGroupChat
    throw UnimplementedError();
  }

  @override
  Future<void> saveContactList(List<Contact> contacts) {
    // TODO: implement saveContactList
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(Message message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  // Verification Code

  @override
  Future<void> sendVerificationCode(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        throw Exception("Fehler bei der Verifizierung: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        print("Code gesendet: $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Auto-Retrieval Timeout: $verificationId");
      },
    );
  }

  // @override
  // Future<void> _startVerification(TextEditingController phoneNumberController, String? selectedCountry) async {
  //   // Validiere Telefonnummer
  //   final phoneNumber = phoneNumberController.text.trim();
  //   if (phoneNumber.isEmpty || selectedCountry == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //           content: Text("Bitte geben Sie eine gültige Telefonnummer ein.")),
  //     );
  //     return;
  //   }
  @override
  Future<void> updateMessage(
      Message message, String newContent, String newTimeStamp) {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      print('exception->$e');
    }
  }
}
