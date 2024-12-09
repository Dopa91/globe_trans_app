import 'package:globe_trans_app/features/adcontact_feature/repository/class.contact.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  final List<Message> _messages = [];
  final List<Chat> _chats = [];
  List<String> saveNames = [];
  List<Contact> contacts = [];

  // @override
  // Future<void> getMessage(Message message) async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   _messages.add(message);
  // }

  @override
  Future<void> sendMessage(Message message) async {
    await Future.delayed(
        const Duration(seconds: 1), () => _messages.add(message));
  }

  @override
  Future<void> deleteMessage(Message message) async {
    await Future.delayed(const Duration(seconds: 1));
    _messages.remove(message);
  }

  @override
  Future<void> updateMessage(
      Message message, String newContent, String newTimeStamp) async {
    final index = _messages.indexOf(message);
    if (index != -1) {
      _messages[index] =
          Message(newContent, message.isSent, DateTime.parse(newTimeStamp));
    }
  }

  @override
  Future<List<Message>> getAllMessages() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.unmodifiable(_messages);
  }

  @override
  Future<void> newGroupChat(List<Message> messages) async {
    await Future.delayed(const Duration(seconds: 1));
    _chats.add(Chat(messages));
  }

  @override
  Future<void> createChat(Message message, String receiver) async {
    await Future.delayed(const Duration(seconds: 1));
    _chats.add(Chat([message]));
  }

  @override
  Future<List<Chat>> getAllChats() async {
    await Future.delayed(const Duration(seconds: 1));
    return _chats;
  }

  // Kontakte
  @override
  Future<List<Contact>> getContactList() async {
    await Future.delayed(const Duration(seconds: 1));
    return contacts; // bearbeiten erledigt
  }

  @override
  Future<void> addContact(
      String name, String email, String phoneNumber, String image) async {
    Contact newContact = Contact(
        name: name, email: email, phoneNumber: phoneNumber, image: image);
    contacts.add(newContact);
    return Future.value();
    // bearbeiten erledigt
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    await Future.delayed(const Duration(seconds: 1));
    contacts.remove(contact); // bearbeiten erledigt
  }

  @override
  Future<void> saveContactList(List<Contact> newContacts) async {
    await Future.delayed(const Duration(seconds: 1));
    contacts = newContacts; // bearbeiten erledigt
  }

  @override
  Future<void> getContact(Contact contact) async {
    await Future.delayed(const Duration(seconds: 1));
    contacts.add(contact); // bearbeiten erledigt
  }

  // Verification Code
  @override
  void sendVerificationCode(String phoneNumber) {
    Future<void> sendVerificationCode() async {
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
