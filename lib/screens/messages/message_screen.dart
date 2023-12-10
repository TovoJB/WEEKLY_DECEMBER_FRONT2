import 'package:chat/constants.dart';
import 'package:chat/screens/messages/components/body.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: const Row(
        children: [
          BackButton(
            color: Colors.white,
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: defaultPadding * 0.75),
          Column(
            children: [
              Text(
                "kristin watson",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam,
              color: Colors.white,
            )),
        const SizedBox(
          width: defaultPadding / 2,
        )
      ],
    );
  }
}
