import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/constTypes.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';
import 'package:omindconsluting/screens/types_questions/audio.dart';
import 'package:omindconsluting/screens/types_questions/image.dart';
import 'package:omindconsluting/screens/types_questions/mcq.dart';
import 'package:omindconsluting/screens/types_questions/range_slide.dart';
import './components/question_text.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/screens/Login/components/background.dart';

class QuestionPage extends StatelessWidget {
  final String documentID;
  final String userId;

  const QuestionPage({Key key, this.documentID, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<QuestionsController>(
                init: QuestionsController(),
                builder: (controller) {
                  if (controller.questionsData != null) {
                    if (controller.questionsData.data != null) {
                      return Column(
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
                                  valueStringInitial: controller
                                      .questionsData.data["valueStringInitial"],
                                  valueStringMedium: controller
                                      .questionsData.data["valueStringMedium"],
                                  valueStringFinal: controller
                                      .questionsData.data["valueStringFinal"],
                                  valueInitial: double.parse(controller
                                      .questionsData.data["valueInitial"]),
                                  valueFinal: double.parse(controller
                                      .questionsData.data["valueFinal"]),
                                )
                              : controller.questionsData.data["type"] ==
                                      ConstTypes.mcqQuestion
                                  ? McqQuestions(
                                      options: controller
                                          .questionsData.data["listOptions"])
                                  : controller.questionsData.data["type"] ==
                                          ConstTypes.imageQuestion
                                      ? ImageQuestions(
                                          options: controller.questionsData
                                              .data["listOptions"],
                                          blankTextQuestion: controller
                                              .questionsData
                                              .data["blankQuestion"],
                                          imageQuestion: controller
                                              .questionsData.data["image"],
                                        )
                                      : AudioQuesitons(
                                          options: controller.questionsData
                                              .data["listOptions"],
                                          blankTextQuestion: controller
                                              .questionsData
                                              .data["blankQuestion"],
                                        ),
                          SizedBox(height: 40),
                          RoundedButton(
                            text: "SEND",
                            press: () async {
                              controller.sendQuestion(
                                  documentID,
                                  controller.questionsData.documentID,
                                  controller.questionsData.data["answer"],
                                  context);
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 130,
                                child: RoundedButton(
                                  text: "BACK",
                                  color: Colors.black87,
                                  press: () async {
                                    if (controller.indexActual != null) {
                                      if (controller.indexActual > 1) {
                                        controller.indexActual -= 1;
                                        print(controller.questionsList[
                                            controller.indexActual - 1]);
                                        print(controller.indexActual);
                                        controller.questionsData =
                                            controller.questionsList[
                                                (controller.indexActual - 1)];

                                        controller.update();
                                      }
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 130,
                                child: RoundedButton(
                                  text: "SKIP",
                                  color: Colors.black87,
                                  press: () async {
                                    print(controller.indexActual);
                                    print(controller.questionsList.length);
                                    if (controller.questionsList.length >
                                        controller.indexActual) {
                                      controller.questionsData =
                                          controller.questionsList[
                                              controller.indexActual++];
                                      controller.update();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      controller.getQuestions(documentID);
                      return Center(child: CircularProgressIndicator());
                    }
                  } else if (controller.questionsList == null) {
                    return Center(
                      child: Text('There are no questions!'),
                    );
                  } else {
                    controller.getQuestions(documentID);
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      ),
    );
  }
}
