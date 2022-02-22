import 'package:chat_app/modules/models/chat_model.dart';
import 'package:chat_app/shared/componentes.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  List<ChatModel> contacts = [
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
    ChatModel(name: 'Dev Stack', status: 'A Flutter Developer'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              '256 Contacts',
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'Invite a friend',
                ),
                PopupMenuItem(
                  child: Text('Contacts'),
                  value: 'Contacts',
                ),
                PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'Refresh',
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                ),
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ButtonCard(
                icon: Icons.group,
                name: 'New group',
              );
            } else if (index == 1) {
              return ButtonCard(
                icon: Icons.person,
                name: 'New contact',
              );
            } else {
              return ContactCard(
                contacts: contacts[index - 2],
              );
            }
          }),
    );
  }
}
