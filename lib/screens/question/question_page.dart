import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './components/range_slide.dart';
import './components/question_text.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/screens/Login/components/background.dart';

class QuestionPage extends StatefulWidget {
  final String documentID;

  const QuestionPage({Key key, this.documentID}) : super(key: key);
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/mindlogo.jpg',
                  ),
                ),
                SizedBox(height: 20),
                QuestionText(),
                SizedBox(height: 10),
                RangeSlide(),
                SizedBox(height: 40),
                RoundedButton(text: "SEND", press: () async {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
