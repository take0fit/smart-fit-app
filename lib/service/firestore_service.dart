import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_fit/model/chat_message_file.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String _makeInquiryMessageCollectionPath({
    required String userId,
    required int inquiryId,
  }) {
    return '/customers/$userId/inquiries/$inquiryId/messages';
  }

  String _makeBeauticianChatMessageCollectionPath({
    required int id,
  }) {
    return '/chats/$id/messages';
  }

  Future<String> getInquiryMessageDocumentId({
    required String userId,
    required int inquiryId,
  }) async {
    return firestore
        .collection(
          _makeInquiryMessageCollectionPath(
            userId: userId,
            inquiryId: inquiryId,
          ),
        )
        .doc()
        .id;
  }

  Query getInquiryMessageCollectionQuery({
    required String userId,
    required int inquiryId,
  }) {
    return firestore
        .collection(
          _makeInquiryMessageCollectionPath(
            userId: userId,
            inquiryId: inquiryId,
          ),
        )
        .orderBy('createdAt', descending: true);
  }

  Future<void> createInquiryMessage({
    required String userId,
    required int inquiryId,
    required String documentId,
    String? text,
    ChatMessageFile? image,
    ChatMessageFile? file,
  }) async {
    await firestore
        .collection(
          _makeInquiryMessageCollectionPath(
            userId: userId,
            inquiryId: inquiryId,
          ),
        )
        .doc(documentId)
        .set({
      'text': text?.isEmpty == true ? null : text,
      'image': image?.toMap(),
      'file': file?.toMap(),
      'operatorId': null,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<String> getBeauticianMessageDocumentId({
    required int id,
  }) async {
    return firestore
        .collection(
          _makeBeauticianChatMessageCollectionPath(
            id: id,
          ),
        )
        .doc()
        .id;
  }

  Query getBeauticianMessageCollectionQuery({
    required int id,
  }) {
    return firestore
        .collection(
          _makeBeauticianChatMessageCollectionPath(
            id: id,
          ),
        )
        .orderBy('createdAt', descending: true);
  }

  Future<void> createBeauticianMessage({
    required int chatId,
    required String messageDocumentId,
    required String customerFirebaseUid,
    String? text,
    ChatMessageFile? image,
    ChatMessageFile? file,
  }) async {
    await firestore
        .collection(
          _makeBeauticianChatMessageCollectionPath(
            id: chatId,
          ),
        )
        .doc(messageDocumentId)
        .set({
      'text': text?.isEmpty == true ? null : text,
      'image': image?.toMap(),
      'file': file?.toMap(),
      'beauticianFirebaseUid': null,
      'customerFirebaseUid': customerFirebaseUid,
      'reservationId': null,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
