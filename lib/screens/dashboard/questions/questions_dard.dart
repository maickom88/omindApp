import 'package:flutter/material.dart';
import 'package:omindconsluting/screens/question/question_page.dart';

class QuestionsCard extends StatefulWidget {
  final documentID;

  const QuestionsCard({Key key, this.documentID}) : super(key: key);
  @override
  _QuestionsCardState createState() => _QuestionsCardState();
}

class _QuestionsCardState extends State<QuestionsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuestionPage(
                    documentID: widget.documentID,
                  ))),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 160,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.amber,
          ),
          child: Center(child: Text('Question 1')),
        ),
      ),
    );
  }
}
