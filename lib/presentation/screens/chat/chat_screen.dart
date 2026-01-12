import 'package:flutter/material.dart';
import 'package:flutter_02_chat/domain/entities/message.dart';
import 'package:flutter_02_chat/presentation/providers/chat_provider.dart';
import 'package:flutter_02_chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:flutter_02_chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_02_chat/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
//Cuando es Screen, lleva automaticamente Scaffle
  @override
  Widget build(BuildContext context) {
//va a estar pendiente de los sucesos de la instancia

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://raulperez.tieneblog.net/wp-content/uploads/2015/09/tux-transparente.png'),
          ),
        ),
        title: const Text('ChatBot'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      //SafeArea guarda espacio (left false -> ignoraria la zona izq)
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController, //vinculado
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            //Cada de texto mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
