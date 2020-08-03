import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:omindconsluting/interfaces/firestore_reposiroy__interface.dart';

class FirestoreRepository extends IFirestoreRepository {
  getQuestion(String documentId) {
    try {
      return Firestore.instance
          .collection('Lifepacks')
          .document(documentId)
          .collection('Questions')
          .getDocuments()
          .then((value) => value.documents);
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

  bool saveRes(res, idLifepacks, idQuestion, idUser, resQuestion) {
    try {
      Firestore.instance
          .collection('Lifepacks')
          .document(idLifepacks)
          .collection('Questions')
          .document(idQuestion)
          .collection('Answers')
          .document()
          .setData({
        'answers': res,
        'idReference': idUser,
        'CorrectAnswer': resQuestion
      });
      return true;
    } catch (e) {
      print("Error $e");
      return false;
    }
  }
}
