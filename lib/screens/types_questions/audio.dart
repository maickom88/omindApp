import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/components/rounded_input_field.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';

class AudioQuesitons extends StatefulWidget {
  final String blankTextQuestion;
  final String fileAudio;
  final List options;

  const AudioQuesitons(
      {Key key, this.blankTextQuestion, this.fileAudio, this.options})
      : super(key: key);

  @override
  _AudioQuesitonsState createState() => _AudioQuesitonsState();
}

class _AudioQuesitonsState extends State<AudioQuesitons> {
  bool _play = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        AudioWidget.network(
          play: _play,
          child: RaisedButton(
              child: Text(
                _play ? "pause" : "play",
              ),
              onPressed: () {
                setState(() {
                  _play = !_play;
                });
              }),
          onReadyToPlay: (duration) {
            //onReadyToPlay
          },
          onPositionChanged: (current, duration) {
            //onReadyToPlay
          },
          url:
              'https://firebasestorage.googleapis.com/v0/b/omnid-bd5df.appspot.com/o/1596478956278-Teu%20Santo%20Nome%20(Sony%20Music%20Live).mp3?alt=media&token=b34b77e7-396d-46e1-8a35-607678c8bd2e',
        ),
        widget.blankTextQuestion != null
            ? blankQuestion(widget.blankTextQuestion)
            : SizedBox(
                width: double.infinity,
                height: 270,
                child: ListView.builder(
                  itemCount: widget.options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GetBuilder<QuestionsController>(
                        init: QuestionsController(),
                        builder: (controller) {
                          return RoundedButton(
                            text: widget.options[index],
                            press: () async {
                              controller.resUser = widget.options[index];
                              controller.btnChangeColor();
                            },
                            color: controller.resUser == widget.options[index]
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
