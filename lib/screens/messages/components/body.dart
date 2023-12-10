import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:chat/screens/messages/components/chat_input_field.dart';
import 'package:chat/screens/messages/components/message.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //List<ChatMessage> demeChatMessages = []; // Liste des messages

  void handleNewMessage(ChatMessage newMessage) {
    setState(() {
      demeChatMessages.add(newMessage); // Ajout du nouveau message à la liste
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => Message(
                  message: demeChatMessages[index],
                ),
              )),
        ),
        ChatInputField(onMessageSent: handleNewMessage)
      ],
    );
  }
}
