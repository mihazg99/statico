import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {

  final void Function() onPressed;
  final String homeText;
  FilterCard(this.onPressed,this.homeText);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Text(
          homeText,
          style: TextStyle(
            color: Colors.black,
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
          color: Color(0xffdfebff),
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
      ),
    );
  }
}
