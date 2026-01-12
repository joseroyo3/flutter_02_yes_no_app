import 'package:flutter/material.dart';
import 'package:flutter_02_chat/config/theme/app_theme.dart';
import 'package:flutter_02_chat/presentation/providers/chat_provider.dart';
import 'package:flutter_02_chat/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';
// mateapp para crear directamente todo

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Yes No App',
          theme: AppTheme(selectedColor: 3).theme(),
          home: const ChatScreen()),
    );
  }
}
