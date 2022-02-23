import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/modules/indicual_screen/indivual_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, this.chatModel}) : super(key: key);
  final ChatModel? chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndviualScreen(
                chatModel: chatModel,
              ),
            ));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                'assets/${chatModel!.icon}',
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              '${chatModel!.name}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(children: [
              Icon(
                Icons.done_all,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '${chatModel!.currentMessage}',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ]),
            trailing: Text('${chatModel!.time}'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, this.contacts}) : super(key: key);

  final ChatModel? contacts;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset(
                'assets/person.svg',
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            contacts!.isSelected == true
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 11,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        '${contacts!.name}',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${contacts!.status}',
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, this.name, this.icon}) : super(key: key);

  final String? name;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(icon, color: Colors.white),
        backgroundColor: Color(0xFF25D366),
      ),
      title: Text(
        '${name}',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    Key? key,
    this.contacts,
  }) : super(key: key);
  final ChatModel? contacts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: SvgPicture.asset(
                  'assets/person.svg',
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 13,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '${contacts!.name}',
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
