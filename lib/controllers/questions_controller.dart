import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/interfaces/firestore_reposiroy__interface.dart';
import 'package:omindconsluting/repositories/firestore_repository.dart';

class QuestionsController extends GetxController {
  IFirestoreRepository firestoreRepository = Get.put(FirestoreRepository());
  List<DocumentSnapshot> questions = [];
  DocumentSnapshot questionsData;

  static QuestionsController get to => Get.find();
  void getQuantQuestions(email) async {
    var result = await firestoreRepository.getQuestions();
    for (var i = 0; i < result.length; i++) {
      if (result[i].data["users"].contains(email)) {
        var doc = result[i];
        questions.add(doc);
        update();
      }
    }
  }

  void getQuestions(documentId) async {
    try {
      firestoreRepository.getQuestion(documentId).listen((event) {
        questionsData = event;

        update();
      });
    } catch (e) {
      print('error controller $e');
    }
  }
}
