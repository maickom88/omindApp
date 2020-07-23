import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/interfaces/firestore_reposiroy__interface.dart';
import 'package:omindconsluting/repositories/firestore_repository.dart';

class QuestionsController extends GetxController {
  IFirestoreRepository firestoreRepository = Get.put(FirestoreRepository());
  List<DocumentSnapshot> questions;
  DocumentSnapshot questionsData;

  void getQuantQuestions() async {
    questions = await firestoreRepository.getQuestions();
    update();
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

    questionsData.data.forEach((key, value) {
      if (key.contains('option')) {}
    });
  }
}
