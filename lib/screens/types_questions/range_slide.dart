import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';

class RangeSlide extends StatelessWidget {
  final double valueInitial;
  final double valueFinal;

  const RangeSlide({Key key, this.valueInitial, this.valueFinal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(valueFinal);
    return Container(
      width: 300,
      height: 100,
      child: GetBuilder<QuestionsController>(
          init: QuestionsController(),
          builder: (controller) {
            return Column(
              children: <Widget>[
                FlutterSlider(
                  values: [valueInitial, valueFinal],
                  max: valueFinal,
                  min: valueInitial,
                  onDragging: (index, down, upp) {
                    print('$index $down $upp');
                    controller.resUser = down;
                  },
                  trackBar: FlutterSliderTrackBar(
                    activeDisabledTrackBarColor: Colors.orange,
                    activeTrackBar: BoxDecoration(color: Colors.transparent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for (var i = 0; i < valueFinal; i++) texts(i + 1),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }

  Text texts(int index) {
    return Text(
      '$index',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    );
  }
}
