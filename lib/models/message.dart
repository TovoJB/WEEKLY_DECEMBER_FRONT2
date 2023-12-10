import 'package:chat/models/ChatMessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void ajouterMessage(String conversationId, String text,
    ChatMessageType messageType, MessageStatus messageStatus, bool isSender) {
  FirebaseFirestore.instance
      .collection('conversations')
      .doc(conversationId)
      .collection('messages')
      .add({
    'text': text,
    'type': messageType.toString(), // Convertir l'énumération en chaîne
    'statut': messageStatus.toString(), // Convertir l'énumération en chaîne
    'isSender': isSender,
    // ... autres champs nécessaires
  }).then((value) {
    print("Message ajouté avec l'ID: ${value.id}");
  }).catchError((error) {
    print("Erreur lors de l'ajout du message: $error");
  });
}
