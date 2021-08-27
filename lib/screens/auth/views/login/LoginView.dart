import 'package:flutter/material.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';
import 'package:statico/screens/auth/views/login/widgets/LoginBtn.dart';
import 'package:statico/screens/auth/views/login/widgets/RegistrationBtn.dart';

class LoginView extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(22, 120, 22, 0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Statico",
                  style: TextStyle(
                    color: Color(
                      0xff131829,
                    ),
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    fontFamily: "IBM Plex Sans",
                    letterSpacing: 1.25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                Forma(),
                SizedBox(height:50),
                LoginBtn(_formKey),
                SizedBox(height: 20,),
                Text("ili",style: TextStyle(fontSize: 14),),
                SizedBox(height: 20,),
                RegistrationBtn()

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Forma() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EMAIL",
              style: TextStyle(
                color: Color(0xff131829),
                fontSize: 12,),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: authController.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
                hintText: 'Unesite email',
              ),
              validator: (input) {

              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "LOZINKA",
              style: TextStyle(
                color: Color(0xff131829),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: authController.passController,
              decoration: InputDecoration(focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Unesite šifru',
              ),
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Lozinka mora sadržavati barem 8 znakova';
                }
                return null;
              },
            ),
          ],
        ));
  }
}
