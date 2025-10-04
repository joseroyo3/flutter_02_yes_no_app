import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(100, 180, 116, 210),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2017/08/06/22/01/books-2596809_1280.jpg'),
          ),
        ),
        title: Text('Biblioteca'),
        //centerTitle: true,  //fuerza a centrar en android
      ),
    );
  }
}
