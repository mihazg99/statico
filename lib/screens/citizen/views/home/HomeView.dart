import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:statico/models/Case.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';
import 'package:statico/screens/citizen/controllers/HomeController.dart';
import 'package:statico/screens/citizen/views/add_case/AddCaseView.dart';
import 'package:get/get.dart';
import 'package:statico/ui_components/btns/PrimaryBtn.dart';
import 'package:statico/ui_components/cards/CaseCardCitizen.dart';

class HomeCitizenView extends StatelessWidget {
  final controller = Get.put(HomeCitzController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND,
        appBar: AppBar(
          backgroundColor: BLUE,
          title: Text(
            "Statico",
          ),
          actions: [
            InkWell(
              child: Center(
                  child: Text(
                "logout".tr,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )),
              onTap: () => controller.api.signOut(),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryBtn(
                  labelText: "submit_case".tr,
                  onPressed: () => Get.to(() => AddCaseView()))
            ],
          ),
        ),
        body: buildBody(context));
  }

  Widget buildBody(context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "submit_title".tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: "IBM Plex Sans",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: MediaQuery.of(context).size.height - 240,
                child: buildStream()),
          ],
        ),
      ),
    );
  }

  Widget buildStream() {
    return StreamBuilder<QuerySnapshot>(
        stream: controller.getCases(Get.find<AuthController>().uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.length == 0) {
            return Center(
                child: Text(
              "none_submitted".tr,
              style: TextStyle(fontSize: 16),
            ));
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index].data();
                var _case = Case.fromMap(data);
                _case.id = snapshot.data!.docs[index].id;
                return CaseCardCitizen(_case);
              });
        });
  }
}
