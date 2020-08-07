import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/interfaces/firestore_reposiroy__interface.dart';
import 'package:omindconsluting/repositories/firestore_repository.dart';
import 'package:omindconsluting/screens/dashboard/dashboard_user.dart';

class QuestionsController extends GetxController {
  IFirestoreRepository firestoreRepository = Get.put(FirestoreRepository());
  List<DocumentSnapshot> questions = [];
  DocumentSnapshot questionsData;
  List<DocumentSnapshot> questionsList;
  bool res;
  dynamic resUser;
  String user;
  String email;
  int indexActual = 1;
  Color color = Colors.black87;
  int index;
  static QuestionsController get to => Get.find();

  void getQuantQuestions(email, uid) async {
    email = email;
    var result = await firestoreRepository.getQuestions();
    print(result);
    for (var i = 0; i < result.length; i++) {
      if (result[i].data["users"].contains(email)) {
        var doc = result[i];
        questions.add(doc);
        user = uid;
      }
    }
    print(result);
    update();
  }

  void getQuestions(documentId) async {
    try {
      questionsList = await firestoreRepository.getQuestion(documentId);
      questionsData = questionsList[0];
      update();
    } catch (e) {
      print('error controller $e');
      questionsData = null;
      questionsList = null;
      update();
    }
  }

  btnChangeColor() {
    color = Colors.green;
    update();
  }

  void sendQuestion(idLifepacks, idQuestion, resQuestion, context) {
    print("$resUser -- $idLifepacks -- $idQuestion -- ${user}");
    res = firestoreRepository.saveRes(
        resUser, idLifepacks, idQuestion, user, resQuestion);
    if (res) {
      var index;
      if (questionsList.length <= 1) {
        questionsData = null;
        questionsList = null;
        update();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardUser(
              email: email,
              uid: user,
            ),
          ),
        );
      } else {
        print(questionsList);
        for (var i = 0; i < questionsList.length; i++) {
          if (questionsList[i].documentID == idQuestion) {
            index = i;
          }
        }
        if ((index + 1) == questionsList.length) {
          questionsData = null;
          questionsList = null;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardUser(
                email: email,
                uid: user,
              ),
            ),
          );
        }
        try {
          questionsData = questionsList[(index + 1)];
          indexActual = (index + 1);
          update();
        } catch (e) {
          questionsData = null;
          questionsList = null;
          update();
        }

        update();
      }
    }
  }
}
