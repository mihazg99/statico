import 'package:statico/models/Case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statico/screens/citizen/views/my_case/MyCaseView.dart';
import 'Label.dart';
import '../btns/SecondaryBtn.dart';

class CaseCardCitizen extends StatelessWidget {

  final Case userCase;
  CaseCardCitizen(this.userCase);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Label(userCase.label),
            SizedBox(height: 12),
            Text(
              userCase.address!,
              style: TextStyle(
                color: Color(
                  0xdd000000,
                ),
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "date".tr+" ${userCase.date.toString()}",
              style: TextStyle(
                color: Color(
                  0xdd000000,
                ),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(height: 25),
            userCase.pictures!.isNotEmpty
                ? Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    userCase.pictures!.first,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
            )
                : Text("no_images".tr),
            SizedBox(height: 15),
            Text(userCase.description!),
            SizedBox(height: 15),
            SecondaryBtn(onPressed: ()=>Get.to(()=>MyCaseView(),arguments: userCase), labelText: 'more'.tr,
            )],
        ),
      ),
    );
  }
}
