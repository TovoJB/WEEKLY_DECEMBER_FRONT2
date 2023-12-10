import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatefulWidget {
  final Function(ChatMessage) onMessageSent;
  const ChatInputField({
    required this.onMessageSent,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  TextEditingController _textEditingController = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();

    _textEditingController.addListener(() {
      setState(() {
        _hasText = _textEditingController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: kPrimaryColor),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.64),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (!_hasText) ...[
                      GestureDetector(
                        onTap: () {
                          ChatMessage newMessage = ChatMessage(
                            text: _textEditingController.text,
                            messageType: ChatMessageType.text,
                            messageStatus: MessageStatus.not_sent,
                            isSender: true,
                          );

                          widget.onMessageSent(newMessage);
                          _textEditingController.clear();
                        },
                        child: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                      ),
                    ] else ...[
                      Icon(
                        Icons.attach_file,
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.64),
                      ),
                      const SizedBox(width: defaultPadding / 4),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.64),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
