import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:omindconsluting/interfaces/firestore_reposiroy__interface.dart';

class FirestoreRepository extends IFirestoreRepository {
  getQuestion(String documentId) {
    try {
      return Firestore.instance
          .collection('Lifepacks')
          .document(documentId)
          .collection('Questions')
          .document('vRawzyDZxZcDe0g03xlk')
          .snapshots();
    } catch (e) {
      print('error $e');
      return null;
    }
  }

  Future<List<DocumentSnapshot>> getQuestions() async {
    var n = await Firestore.instance
        .collection('Lifepacks')
        .getDocuments()
        .then((value) => value.documents);
    return n;
  }
}
