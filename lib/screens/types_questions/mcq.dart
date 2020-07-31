import 'package:flutter/material.dart';
import 'package:omindconsluting/components/rounded_button.dart';

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

  RoundedButton optionsQuestions(String text) {
    return RoundedButton(
      text: text,
      press: () async {},
      color: Colors.black87,
    );
  }
}
