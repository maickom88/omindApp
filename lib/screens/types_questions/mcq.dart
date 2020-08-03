import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';

class McqQuestions extends StatelessWidget {
  final List options;

  const McqQuestions({Key key, this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        for (var i = 0; i < options.length; i++)
          optionsQuestions("Option${i + 1}: ${options[i]}"),
      ],
    );
  }

  optionsQuestions(String text) {
    return GetBuilder<QuestionsController>(
        init: QuestionsController(),
        builder: (controller) {
          return RoundedButton(
            text: text,
            press: () async {
              controller.resUser = text;
              controller.btnChangeColor();
            },
            color:
                controller.resUser == text ? controller.color : Colors.black87,
          );
        });
  }
}
