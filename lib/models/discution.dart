import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void ajouterConversation(
    String name, String lastMessage, String image, String time) {
  FirebaseFirestore.instance.collection('conversations').add({
    'name': name,
    'lastMessage': lastMessage,
    'image': image,
    'time': time,
    // ... autres champs nécessaires
  })
  .then((value) {
    print("Conversation ajoutée avec l'ID: ${value.id}");
  })
  .catchError((error) {
    print("Erreur lors de l'ajout de la conversation: $error");
  });
}

