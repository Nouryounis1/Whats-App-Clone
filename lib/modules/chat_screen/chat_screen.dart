import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/modules/contact_screen/contact_screen.dart';
import 'package:chat_app/shared/componentes.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chats = [
    ChatModel(
        name: 'Dev Stack',
        isGroup: false,
        currentMessage: 'Hi Everyone',
        time: '4:00',
        icon: 'person.svg'),
    ChatModel(
        name: 'Dev Stack',
        isGroup: false,
        currentMessage: 'Hi Everyone',
        time: '4:00',
        icon: 'person.svg'),
    ChatModel(
        name: 'Dev Stack',
        isGroup: true,
        currentMessage: 'Hi Everyone',
        time: '4:00',
        icon: 'group.svg'),
    ChatModel(
        name: 'Dev Stack',
        isGroup: false,
        currentMessage: 'Hi Everyone',
        time: '4:00',
        icon: 'person.svg'),
    ChatModel(
        name: 'Dev Stack',
        isGroup: true,
        currentMessage: 'Hi Everyone',
        time: '4:00',
        icon: 'group.svg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactScreen(),
                ));
          },
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(
            chatModel: chats[index],
          ),
        ));
  }
}
