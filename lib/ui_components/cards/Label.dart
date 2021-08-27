import 'package:flutter/material.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:get/get.dart';

class Label extends StatelessWidget {
  final label;
  Label(this.label);

  @override
  Widget build(BuildContext context) {
    Color _color;
    String labelText;
    Color textColor;

    if (label == "NEUPORABLJIVO") {
      _color = NEUPORABLJIVO;
      labelText = "usable".tr;
      textColor = Colors.white;
    } else if (label == "PRIVREMENO NEUPORABLJIVO") {
      _color = PRIVNEUPORABLJIVO;
      labelText = "temp".tr;
      textColor = Colors.black;
    } else if (label == "UPORABLJIVO") {
      _color = UPORABLJIVO;
      labelText = "usable".tr;
      textColor = Colors.white;
    } else {
      labelText = "not_rated".tr;
      _color = Color(0xffdfebff);
      textColor = Colors.black;
    }

    return Container(
      child: Text(
        labelText,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          letterSpacing: 1.149999976158142,
        ),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
    );
  }
}
