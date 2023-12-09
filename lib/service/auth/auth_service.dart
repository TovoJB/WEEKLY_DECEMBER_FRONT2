import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
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
      throw Exception(e.code);
    }
  }
  // sing user out
}
