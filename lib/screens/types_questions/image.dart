import 'package:flutter/material.dart';
import 'package:omindconsluting/components/rounded_button.dart';

class ImageQuestions extends StatelessWidget {
  final String blankTextQuestion;
  final String imageQuestion;
  final List options;

  const ImageQuestions(
      {Key key, this.blankTextQuestion, this.imageQuestion, this.options})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(options);
    return Column(
      children: <Widget>[
        Image.network(
          imageQuestion,
          height: 250,
        ),
        SizedBox(height: 10),
        if (blankTextQuestion == null)
          for (var i = 0; i < options.length; i++)
            optionsQuestions("Option${i + 1}: ${options[i]}"),
        if (blankTextQuestion != null) blankQuestion(blankTextQuestion),
      ],
    );
  }

  Text blankQuestion(String text) {
    return Text(text);
  }

  RoundedButton optionsQuestions(String text) {
    return RoundedButton(
      text: text,
      press: () async {},
      color: Colors.black87,
    );
  }
}
