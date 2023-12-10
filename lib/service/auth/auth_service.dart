import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //sing user in
  Future<UserCredential> singInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
      //cath any errors
    } on FirebaseAuthException catch (e) {
      print("email " + email + " pass : " + password);

      throw Exception(e.code);
    }
  }

  // sing user out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  //create a new user
  Future<UserCredential> signUpWithEmailandPassworl(
      String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
