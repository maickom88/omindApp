import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/screens/question/question_page.dart';
import '../../../controllers/questions_controller.dart';
import 'dialog_details.dart';

class CardsList extends StatefulWidget {
  final Function press;
  final String titleQuestion;
  final String desQuestion;
  final String documentId;
  final String uid;
  final String email;

  const CardsList(
      {Key key,
      this.press,
      this.titleQuestion,
      this.desQuestion,
      this.documentId,
      this.uid,
      this.email})
      : super(key: key);

  @override
  _CardsListState createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFDB9B10),
      child: ListTile(
        onTap: () {
          print(widget.uid);
          QuestionsController.to.getQuestions(widget.documentId);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionPage(
                    documentID: widget.documentId, userId: widget.uid),
              )).then((value) {
            QuestionsController.to.questionsData = null;
            QuestionsController.to.questionsList = null;
            QuestionsController.to.onStart();
            QuestionsController.to.getQuantQuestions(widget.email, widget.uid);
            QuestionsController.to.getQuestions(widget.documentId);
            QuestionsController.to.indexActual = 1;
            QuestionsController.to.update();

            print('Volteiiii');
          });
        },
        leading: IconButton(
          icon: Icon(
            Icons.list,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text(widget.titleQuestion,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(
          widget.desQuestion,
          style: TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: Icon(Icons.person, color: Colors.white),
          onPressed: () {},
        ),
      ),
    );
  }
}
