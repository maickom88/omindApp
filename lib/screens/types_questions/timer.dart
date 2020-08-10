import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerQuestion extends StatelessWidget {
  final List options;
  final int timer;

  const TimerQuestion({Key key, this.options, this.timer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GetBuilder<QuestionsController>(
            init: QuestionsController(),
            builder: (controller) {
              return CircularCountDownTimer(
                duration: timer,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                fillColor: Theme.of(context).primaryColor,
                strokeWidth: 5.0,
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
                isReverse: false,
                onComplete: () async {
                  if (controller.questionsList.length >
                      controller.indexActual) {
                    controller.questionsData =
                        controller.questionsList[controller.indexActual++];
                    controller.update();
                  } else {
                    Navigator.pop(context);
                  }
                },
              );
            }),
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
