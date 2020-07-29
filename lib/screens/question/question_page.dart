import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/constTypes.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';
import 'package:omindconsluting/screens/types_questions/image.dart';
import 'package:omindconsluting/screens/types_questions/range_slide.dart';
import './components/question_text.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/screens/Login/components/background.dart';

class QuestionPage extends StatelessWidget {
  final String documentID;

  const QuestionPage({Key key, this.documentID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
        init: QuestionsController(),
        builder: (controller) {
          if (controller.questionsData != null) {
            var valueInitial;
            var valueFinal;
            if (valueInitial == null && valueFinal == null) {
              valueInitial = controller.questionsData.data["valueInitial"];
              valueFinal = controller.questionsData.data["valueFinal"];
            }

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
                        QuestionText(
                          textQuestions:
                              controller.questionsData.data["desQuestion"],
                        ),
                        SizedBox(height: 10),
                        controller.questionsData.data["type"] ==
                                ConstTypes.rangSlidQuestion
                            ? RangeSlide(
                                valueInitial: double.parse(valueInitial),
                                valueFinal: double.parse(valueFinal),
                              )
                            : controller.questionsData.data["type"] ==
                                    ConstTypes.mcqQuestion
                                ? Text('olá')
                                : controller.questionsData.data["type"] ==
                                        ConstTypes.imageQuestion
                                    ? ImageQuestions(
                                        options: controller
                                            .questionsData.data["listOptions"],
                                        blankTextQuestion: controller
                                            .questionsData
                                            .data["blankQuestion"],
                                        imageQuestion: controller
                                            .questionsData.data["image"],
                                      )
                                    : Text('olá'),
                        SizedBox(height: 40),
                        RoundedButton(text: "SEND", press: () async {}),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            controller.getQuestions('C22ctb1JAJvoTs35mvc5');
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
