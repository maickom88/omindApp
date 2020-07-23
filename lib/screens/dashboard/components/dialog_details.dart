import 'package:flutter/material.dart';

class DialogDetails extends StatefulWidget {
  @override
  _DialogDetailsState createState() => _DialogDetailsState();
}

class _DialogDetailsState extends State<DialogDetails> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetAnimationDuration: Duration(milliseconds: 250),
      insetPadding: EdgeInsets.all(10),
      insetAnimationCurve: Curves.elasticOut,
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 15, bottom: 0, right: 15),
        height: 180,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'erro',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
