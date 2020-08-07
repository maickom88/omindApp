import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';

class RangeSlide extends StatelessWidget {
  final double valueInitial;
  final double valueFinal;
  final String valueStringInitial;
  final String valueStringMedium;
  final String valueStringFinal;

  const RangeSlide(
      {Key key,
      this.valueInitial,
      this.valueFinal,
      this.valueStringInitial,
      this.valueStringMedium,
      this.valueStringFinal})
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
                  centeredOrigin: true,
                  values: [(valueFinal / 2).roundToDouble()],
                  max: valueFinal,
                  min: valueInitial,
                  onDragging: (index, down, upp) {
                    controller.resUser = down;
                  },
                  trackBar: FlutterSliderTrackBar(
                    activeDisabledTrackBarColor: Colors.orange,
                    activeTrackBar: BoxDecoration(color: Colors.transparent),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       for (var i = 0; i < valueFinal; i++) texts(i + 1),
                //     ],
                //   ),
                // ),
                Visibility(
                  visible: valueStringInitial != null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          valueStringInitial,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          valueStringMedium,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          valueStringFinal,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
