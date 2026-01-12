import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_02_chat/domain/entities/message.dart';
import 'package:flutter_02_chat/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //busca el tema dentro del contexto
    final colors = Theme.of(context).colorScheme;
    //
    final chatProvider = context.watch<ChatProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
