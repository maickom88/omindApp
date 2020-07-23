import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: Text(
        'How often have you shared knowledge with a colleague last week?',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }
}
