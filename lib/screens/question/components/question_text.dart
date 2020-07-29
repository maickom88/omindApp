import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String textQuestions;

  const QuestionText({Key key, this.textQuestions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: Text(
        textQuestions,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }
}
