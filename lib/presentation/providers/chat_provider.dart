import 'package:flutter/material.dart';
import 'package:flutter_02_chat/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_02_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hellooooow', fromWho: FromWho.mine),
    Message(
      text: 'Ya regresaste?',
      fromWho: FromWho.mine,
    )
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);

    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }
    // notifica que ha cambiado algo a todos los que escuchen
    notifyListeners();
    moveScollToBottom();
  }

  Future<void> herReply() async {
    final HerMessage = await getYesNoAnswer.getAnswer();
    messageList.add(HerMessage);
    notifyListeners();

    moveScollToBottom();
  }

  Future<void> moveScollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
