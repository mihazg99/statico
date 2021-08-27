import 'package:flutter/material.dart';

class SecondaryBtn extends StatelessWidget {

  final void Function() onPressed;
  final String labelText;
  SecondaryBtn({required this.onPressed,required this.labelText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              labelText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
                letterSpacing: 1.25,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            )
          ],
        ),
        width: MediaQuery.of(context).size.width - 30,
        padding: EdgeInsets.symmetric(
          horizontal: 87,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Color(
            0xfffffff,
          ),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
    );
  }
}
