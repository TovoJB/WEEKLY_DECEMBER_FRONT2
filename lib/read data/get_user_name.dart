import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  const GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('users_collection');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            ;
            return Text('${data['name']}');
          }
          return Text('loading');
        }));
  }
}

Future<String?> getUserNameFromEmail(String email) async {
  String? userName;

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection(
          'users_collection') // Remplacez 'users' par le nom de votre collection
      .where('email', isEqualTo: email) // Recherche par adresse e-mail
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    // Si un document correspondant à l'e-mail est trouvé
    userName =
        querySnapshot.docs.first.get('name'); // Récupérer le champ 'name'
  }
  print('username = ${userName}');
  return userName;
}
