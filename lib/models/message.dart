import 'package:chat/models/ChatMessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void ajouterMessage(
  String conversationId,
  String text,
  ChatMessageType messageType,
  MessageStatus messageStatus,
  bool isSender,
  String senderId, // ID de l'utilisateur qui envoie le message
  String receiverId, // ID du destinataire
) {
  FirebaseFirestore.instance
      .collection('conversations')
      .doc(conversationId)
      .collection('messages')
      .add({
    'text': text,
    'type': messageType.toString(),
    'statut': messageStatus.toString(),
    'isSender': isSender,
    'senderId': senderId, // Ajouter l'ID de l'utilisateur qui envoie le message
    'receiverId': receiverId, // Ajouter l'ID du destinataire
    // ... autres champs nécessaires
  }).then((value) {
    print("Message ajouté avec l'ID: ${value.id}");
  }).catchError((error) {
    print("Erreur lors de l'ajout du message: $error");
  });
}
