import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statico/screens/auth/controllers/RegisterController.dart';

class RegFormThree extends StatelessWidget {

  final RegisterViewController regController = RegisterViewController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          key: regController.formKey3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "EMAIL",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: regController.emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite email adresu',
                ),
                validator: (input) {
                  if (GetUtils.isEmail(regController.emailController.text)) {
                    return null;
                  } else {
                    return "Unesite valjanu email adresu";
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "ŠIFRA",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: regController.passController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite šifru',
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'Šifra mora sadržavati barem 8 znakova';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "ŠIFRA PONOVNO",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: regController.repassController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Ponovo unesite šifru',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      validatePassword(regController.passController.text, value) != true) {
                    return "Šifra se ne podudara";
                  }
                  return null;
                },
              ),
            ],
          )),
    );
  }

  bool validatePassword(String password, String repassword) {
    if (repassword == null) {
      return false;
    }
    int isTrue = password.compareTo(repassword);

    if (isTrue == 0) {
      return true;
    }
    return false;
  }
}
