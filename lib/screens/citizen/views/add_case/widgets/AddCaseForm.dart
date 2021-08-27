import 'package:flutter/material.dart';
import 'package:statico/screens/citizen/controllers/AddCaseController.dart';


class AddCaseForm extends StatelessWidget {

  final AddCaseController controller = AddCaseController.to;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description),
              SizedBox(
                width: 10,
              ),
              Text(
                "OPIS",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: controller.descriptionController,
            maxLines: 3,
            decoration: InputDecoration(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),borderSide: BorderSide(color: Colors.black38)),
              hintText: 'Opišite stanje objekta',

            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(
                width: 10,
              ),
              Text(
                "KONTAKT BROJ",
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: controller.contactController,
            decoration: InputDecoration(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              hintText: 'Unesite broj za kontakt',
            ),
            validator: (input) {
              if (input!.length < 9) {
                return "Unesite valjani telefonski broj";
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
