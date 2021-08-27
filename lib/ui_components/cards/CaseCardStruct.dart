import 'package:flutter/material.dart';
import 'package:statico/models/Case.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';
import 'package:statico/screens/struct_eng/views/my_case/MyCase.dart';
import 'package:statico/services/ApiManager.dart';
import 'file:///C:/Users/Mihael/Documents/FlutterProjekti/Statico/statico/lib/ui_components/btns/SecondaryBtn.dart';
import 'package:get/get.dart';

class CaseCardStruct extends StatelessWidget {

  final Case userCase;
  final ApiManager api = ApiManager();
  CaseCardStruct(this.userCase);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Row(
              children: [
                getIcon(userCase.objectType),
                SizedBox(
                  width: 10,
                ),
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
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "priority".tr+": ${userCase.priority}",
              style: TextStyle(
                color: Color(
                  0xdd000000,
                ),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "date".tr+": ${userCase.date}",
              style: TextStyle(
                color: Color(
                  0xdd000000,
                ),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(height: 15),
            Text(userCase.description!),
            SizedBox(height: 15),
            userCase.pictures!.isNotEmpty
                ? Container(
              height: 140,
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
            userCase.status == "waiting" ? SecondaryBtn(onPressed: ()=>api.updateCase(userCase.id, Get.find<AuthController>().uid), labelText: 'accept'.tr,) : SecondaryBtn(onPressed: ()=>Get.to(()=>MyCase(),arguments: userCase), labelText: 'Više',
            )],
        ),
      ),
    );
  }

  Widget getIcon(String? text) {
    if (text == "Kuća") {
      return Icon(Icons.home);
    } else if (text == "Stambena zgrada") {
      return Icon(Icons.apartment);
    } else {
      return Icon(Icons.local_hospital);
    }
  }
}
