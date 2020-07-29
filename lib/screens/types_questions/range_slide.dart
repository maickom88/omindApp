import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

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
      child: Column(
        children: <Widget>[
          FlutterSlider(
            values: [1, 5, 10],
            max: 10,
            min: 1,
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
      ),
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
