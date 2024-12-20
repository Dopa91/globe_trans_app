import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globe_trans_app/features/adcontact_feature/presentation/class.contact.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';

class FirebaseDatabaseRepository implements DatabaseRepository {
  // Kontakt hinzufügen
  @override
  Future<void> addContact(
      String name, String email, String phoneNumber, String image) async {
    final firestore = FirebaseFirestore.instance;
    String userId = await getUserId();
    await firestore.collection("users").doc(userId).collection("contacts").add({
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "image": image,
    });
  }

  // Benutzer-ID abrufen
  Future<String> getUserId() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user != null) {
        return user.uid;
      } else {
        print("Kein authentifizierter Benutzer gefunden.");
        return '';
      }
    } catch (e) {
      print("Fehler beim Abrufen der Benutzer-ID: $e");
      return '';
    }
  }

  @override
  Future<void> createChat(Message message, String receiver) async {
    // Muss noch implementiert werden
  }

  // Kontakt löschen
  @override
  Future<void> deleteContact(Contact contact) async {
    final firestore = FirebaseFirestore.instance;
    String userId = await getUserId();
    await firestore
        .collection("users")
        .doc(userId)
        .collection("contacts")
        .doc(contact.name)
        .delete();
  }

  @override
  Future<void> deleteMessage(Message message) async {
    // Muss noch implementiert werden
  }

  @override
  Future<List<Chat>> getAllChats() async {
    // Muss noch implementiert werden
    throw UnimplementedError();
  }

  final List<Message> _messages = [];

  // Rufe alle Nachrichten ab
  @override
  Future<List<Message>> getAllMessages() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.unmodifiable(_messages);
  }

  @override
  Future<void> getContact(Contact contact) async {
    // Muss noch implementiert werden
  }

  // Rufe Kontaktliste ab
  @override
  Future<List<Contact>> getContactList() async {
    final firestore = FirebaseFirestore.instance;
    String userId = await getUserId();
    final snapshot = await firestore
        .collection("users")
        .doc(userId)
        .collection("contacts")
        .get();
    return snapshot.docs
        .map((doc) => Contact(
            name: doc["name"],
            email: doc["email"],
            phoneNumber: doc["phoneNumber"],
            image: doc["image"]))
        .toList();
  }

  @override
  Future<void> newGroupChat(List<Message> messages) async {
    // Muss noch implementiert werden
  }

  @override
  Future<void> saveContactList(List<Contact> contacts) async {
    // Muss noch implementiert werden
  }

  @override
  Future<void> sendMessage(Message message) async {
    // Muss noch implementiert werden
  }

  @override
  Future<void> updateMessage(
      Message message, String newContent, String newTimeStamp) async {
    // Muss noch implementiert werden
    throw UnimplementedError();
  }
}
