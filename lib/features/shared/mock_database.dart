import 'package:globe_trans_app/features/adcontact_feature/presentation/class.contact.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  final List<Message> _messages = [];
  final List<Chat> _chats = [];
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

  // Kontakte abrufen
  @override
  Future<List<Contact>> getContactList() async {
    await Future.delayed(const Duration(seconds: 1));
    return contacts;
  }

  // Kontakt hinzufügen
  @override
  Future<void> addContact(
      String name, String email, String phoneNumber, String image) async {
    Contact newContact = Contact(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        image: image,
        id: '');
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

  @override
  Future<void> updateContact(
      String id, String name, String email, String phoneNumber) async {
    // Suche den Kontakt anhand der ID
    final index = contacts.indexWhere((contact) => contact.id == id);

    // Wenn der Kontakt gefunden wurde, aktualisiere ihn
    if (index != -1) {
      contacts[index] = Contact(
        id: id,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        image: contacts[index].image, // Behalte das Bild des Kontakts bei
      );
    }

    await Future.delayed(const Duration(seconds: 1));
  }
}
