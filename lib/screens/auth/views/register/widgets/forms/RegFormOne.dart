import 'package:flutter/material.dart';
import 'package:statico/screens/auth/controllers/RegisterController.dart';

class RegFormOne extends StatelessWidget {

  final RegisterViewController regController = RegisterViewController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          key: regController.formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "IME",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: regController.nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite svoje ime',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Molimo unesite svoje ime';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "PREZIME",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: regController.surnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite svoje prezime',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Molimo unesite svoje prezime';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "OIB",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: regController.oibController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite svoj OIB',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Unesite svoj OIB';
                  }
                  return null;
                },
              ),
            ],
          )),
    );
  }
}
