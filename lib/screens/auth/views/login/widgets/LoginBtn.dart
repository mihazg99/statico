import 'package:flutter/material.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';


class LoginBtn extends StatelessWidget {

  final AuthController authController = AuthController.to;

  final formKey;
  LoginBtn(this.formKey);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(formKey.currentState.validate()){
          authController.api.signInWithEmail(authController.emailController.text, authController.passController.text);
        }

      },
      child: Container(
        child: Text(
          "Prijava",
          style: TextStyle(
            color: Colors.white,
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
            0xff0046b1,
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
    );
  }
}
