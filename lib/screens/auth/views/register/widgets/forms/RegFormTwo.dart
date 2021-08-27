import 'package:flutter/material.dart';
import 'package:statico/screens/auth/controllers/RegisterController.dart';

class RegFormTwo extends StatelessWidget {

  final RegisterViewController regController = RegisterViewController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          key: regController.formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "ADRESA",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: regController.addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite svoju adresu',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Molimo unesite svoju adresu';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "ŽUPANIJA",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: regController.provinceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite svoju županiju',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Molimo unesite svoju županiju';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "GRAD",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: regController.cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Unesite grad prebivališta',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Molimo unesite grad prebivališta';
                  }
                  return null;
                },
              ),
            ],
          )),
    );
  }
}
