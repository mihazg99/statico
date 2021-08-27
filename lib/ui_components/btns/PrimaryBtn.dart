import 'package:flutter/material.dart';
import 'package:statico/misc/constants/Colors.dart';

class PrimaryBtn extends StatelessWidget {

  PrimaryBtn({required this.labelText, required this.onPressed});

  final String labelText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: BLUE,
          ),
          width: MediaQuery.of(context).size.width - 50,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(labelText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                  letterSpacing: 1.25,
                ),
                textAlign: TextAlign.center,
              ),
              //SizedBox(width: 5,),
              //Icon(Icons.arrow_forward,color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
