import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/Chat.dart';
import 'package:chat/screens/chats/components/chat_card.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

class BodyChats extends StatelessWidget {
  const BodyChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              defaultPadding, 0, defaultPadding, defaultPadding),
          color: kPrimaryColor,
          child: Row(children: [
            FillOutlineButton(press: () {}, text: 'Recent Message'),
            const SizedBox(width: defaultPadding),
            FillOutlineButton(
              press: () {},
              text: 'Activite',
              isFilled: false,
            )
          ]),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) => chatCard(
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MessagesScreen())),
                      chat: chatsData[index],
                    )))
                    
      ],
    );
  }
}
