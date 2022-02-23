import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/shared/componentes.dart';
import 'package:flutter/material.dart';

class NewGroupScreen extends StatefulWidget {
  NewGroupScreen({Key? key}) : super(key: key);

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
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

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              'Add participants',
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index - 1].isSelected == false) {
                      setState(() {
                        contacts[index - 1].isSelected = true;
                        groups.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].isSelected = false;
                        groups.remove(contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactCard(
                    contacts: contacts[index - 1],
                  ),
                );
              }),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            contacts[index].isSelected == false
                                ? Container()
                                : InkWell(
                                    onTap: () {
                                      if (contacts[index].isSelected == true) {
                                        setState(() {
                                          contacts[index].isSelected = false;
                                        });
                                      }
                                    },
                                    child: AvatarCard(
                                      contacts: contacts[index],
                                    ),
                                  ),
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
