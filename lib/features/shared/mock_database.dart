import 'package:globe_trans_app/features/adcontact_feature/presentation/class.contact.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  @override
  void notifyListeners() {
    // noch nicht implementiert
  }

  final List<Message> _messages = [];
  final List<Chat> _chats = [];
  final List<Contact> _chatContacts = [];
  List<String> saveNames = [];
  List<Contact> contacts = [];

  // Sende Nachrichten
  @override
  Future<void> sendMessage(Message message) async {
    await Future.delayed(
        const Duration(seconds: 1), () => _messages.add(message));
  }

  // Löschen einer Nachricht
  @override
  Future<void> deleteMessage(Message message) async {
    await Future.delayed(const Duration(seconds: 1));
    _messages.remove(message);
  }

  // Update einer Nachricht
  @override
  Future<void> updateMessage(
      Message message, String newContent, String newTimeStamp) async {
    final index = _messages.indexOf(message);
    if (index != -1) {
      _messages[index] =
          Message(newContent, message.isSent, DateTime.parse(newTimeStamp));
    }
  }

  // Übersicht aller Nachrichten
  @override
  Future<List<Message>> getAllMessages() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.unmodifiable(_messages);
  }

  // Neue Chat Gruppe erstellen
  @override
  Future<void> newGroupChat(List<Message> messages) async {
    await Future.delayed(const Duration(seconds: 1));
    _chats.add(Chat(messages));
  }

  // Neue Chat erstellen
  @override
  Future<void> createChat(Message message, String receiver) async {
    await Future.delayed(const Duration(seconds: 1));
    _chats.add(Chat([message]));
  }

  // Übersicht aller Chats
  @override
  Future<List<Chat>> getAllChats() async {
    await Future.delayed(const Duration(seconds: 1));
    return _chats;
  }

  // Chat Kontakte hinzufügen
  @override
  Future<void> addToChats(Contact contact) async {
    if (!_chatContacts.contains(contact)) {
      _chatContacts.add(contact);
    }
  }

// Chat Kontakte abrufen
  @override
  Future<List<Contact>> getChatContacts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _chatContacts;
  }

  // Kontakte abrufen
  @override
  Future<List<Contact>> getContactList() async {
    await Future.delayed(const Duration(seconds: 1));
    return contacts;
  }

  // Kontakt hinzufügen
  @override
  Future<void> addContact(String firstName, String lastName, String email,
      String phoneNumber, String image) async {
    Contact newContact = Contact(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        image: image);
    contacts.add(newContact);
    return Future.value();
  }

  // Kontakt löschen
  @override
  Future<void> deleteContact(Contact contact) async {
    await Future.delayed(const Duration(seconds: 1));
    contacts.remove(contact);
  }

  // Kontaktliste speichern
  @override
  Future<void> saveContactList(List<Contact> newContacts) async {
    await Future.delayed(const Duration(seconds: 1));
    contacts = newContacts;
  }

  // Kontakt anzeigen
  @override
  Future<void> getContact(Contact contact) async {
    await Future.delayed(const Duration(seconds: 1));
    contacts.add(contact);
  }
}
