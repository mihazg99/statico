import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statico/screens/auth/views/register/RegisterView.dart';

class RegistrationBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=>Get.to(()=>RegisterView()),
      child: Container(
        child: Text(
          "Registracija",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            letterSpacing: 1.25,
          ),
          textAlign: TextAlign.center,
        ),
        width: MediaQuery.of(context).size.width-30,
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
