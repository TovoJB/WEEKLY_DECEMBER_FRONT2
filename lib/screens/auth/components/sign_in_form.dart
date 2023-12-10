/*import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:chat/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void singIn() {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      authService.singInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            validator: RequiredValidator(errorText: requiredField),
            decoration: const InputDecoration(hintText: 'Username'),
            textInputAction: TextInputAction.next,
            onSaved: (username) {
              // Save it
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              validator: RequiredValidator(errorText: "Password is required"),
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onSaved: (passaword) {
                // Save it
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => const MessagesScreen(),
                    builder: (context) => const ChatsScreen(),
                  ),
                );
                singIn();
              }
            },
            child: const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
*/