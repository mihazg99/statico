import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statico/screens/struct_eng/controllers/RateController.dart';

class OnFieldForm extends StatelessWidget {
  final controller = RateController.to;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "onField".tr,
              style: TextStyle(fontWeight: FontWeight.w500,
                color: Color(0xff131829),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                maxLines: 17,
                maxLength: 800,
                controller: controller.onFieldReportController)
          ],
        ));
  }
}
