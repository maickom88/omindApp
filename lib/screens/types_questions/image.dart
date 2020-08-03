import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/components/rounded_input_field.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';

class ImageQuestions extends StatelessWidget {
  final String blankTextQuestion;
  final String imageQuestion;
  final List options;

  const ImageQuestions(
      {Key key, this.blankTextQuestion, this.imageQuestion, this.options})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
          imageQuestion,
          height: 250,
        ),
        SizedBox(height: 10),
        blankTextQuestion != null
            ? blankQuestion(blankTextQuestion)
            : SizedBox(
                width: double.infinity,
                height: 270,
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GetBuilder<QuestionsController>(
                        init: QuestionsController(),
                        builder: (controller) {
                          return RoundedButton(
                            text: options[index],
                            press: () async {
                              controller.resUser = options[index];
                              controller.btnChangeColor();
                            },
                            color: controller.resUser == options[index]
                                ? controller.color
                                : Colors.black87,
                          );
                        });
                  },
                ),
              ),
      ],
    );
  }

  blankQuestion(String text) {
    return GetBuilder<QuestionsController>(
        init: QuestionsController(),
        builder: (controller) {
          return RoundedInputField(
            hintText: text,
            icon: Icons.question_answer,
            onChanged: (value) => controller.resUser = value,
          );
        });
  }

  optionsQuestions(String text, Color color) {
    return GetBuilder<QuestionsController>(
        init: QuestionsController(),
        builder: (controller) {
          return RoundedButton(
            text: text,
            press: () async {
              controller.resUser = text;
              controller.btnChangeColor();
              print(text);
            },
            color: color ?? Colors.black87,
          );
        });
  }
}
