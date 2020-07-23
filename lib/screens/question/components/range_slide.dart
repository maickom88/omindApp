import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RangeSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      child: Column(
        children: <Widget>[
          FlutterSlider(
            values: [1, 2, 3, 4, 5],
            max: 5,
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
                Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(
                  '3',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(
                  '4',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(
                  '5',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
