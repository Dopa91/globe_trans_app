import 'package:globe_trans_app/database_repository.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';

class MockDatabase implements DatabaseRepository {
  final List<Message> _messages = [];
  final List<Chat> _chats = [];

  @override
  Future<void> sendMessage(Message message) async {
    await Future.delayed(const Duration(seconds: 1));
    _messages.add(message);
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
    return List.unmodifiable(_chats);
  }
}
