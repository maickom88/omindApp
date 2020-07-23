import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';

import 'cards_list.dart';
import 'dialog_details.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/signup_top.png',
          height: _height * 0.22,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.archive,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: _height * 0.10),
            Expanded(
              child: GetBuilder<QuestionsController>(
                  init: QuestionsController(),
                  builder: (controller) {
                    controller.getQuantQuestions();
                    if (controller.questions != null) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.questions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardsList(
                            titleQuestion: controller
                                .questions[index].data['LifePackName'],
                            desQuestion:
                                controller.questions[index].data['Description'],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ],
    );
  }
}
