import 'package:chat/constants.dart';
import 'package:chat/screens/chats/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyChats(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_1),
      ),
      bottomNavigationBar: buildBottomNavigationButton(),
    );
  }

  BottomNavigationBar buildBottomNavigationButton() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "chats"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "people"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "calls"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage("assets/images/user_2.png"),
              ),
              label: "profile"),
        ]);
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'chats',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () { FirebaseAuth.instance.signOut();})
      ],
      backgroundColor: kPrimaryColor,
    );
  }
}