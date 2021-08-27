import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:statico/models/Case.dart';
import 'package:statico/screens/struct_eng/controllers/HomeController.dart';
import 'package:get/get.dart';
import 'package:statico/ui_components/cards/CaseCardStruct.dart';
import 'package:statico/ui_components/cards/FilterCard.dart';

class HomeStructView extends StatelessWidget {
  final controller = Get.put(HomeStructController());

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
      body: Obx(
        () => Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Icon(Icons.filter_alt),
                      SizedBox(
                        width: 10,
                      ),
                      FilterCard(() {
                        controller.filter.value = "waiting";
                        controller.homeText.value = "waiting_title".tr;
                      }, "Štete na čekanju"),
                      SizedBox(
                        width: 15,
                      ),
                      FilterCard(() {
                        controller.filter.value = "Accepted";
                        controller.homeText.value = "accepted_title".tr;
                      }, "Prihvaćene štete"),
                      SizedBox(
                        width: 15,
                      ),
                      FilterCard(() {
                        controller.filter.value = "Ocijenjeno";
                        controller.homeText.value = "rated_title".tr;
                      }, "Ocijenjene štete"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Obx(
                    () => Text(
                      controller.homeText.value,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: "IBM Plex Sans",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
            Container(child: controller.filter.value == "waiting"
                              ? buildStreamWaiting()
                              : controller.filter.value == "Ocijenjeno" ? buildStreamRated(): buildStreamAccepted(),
                        height: MediaQuery.of(context).size.height - 215),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStreamAccepted() {
    print("build accepted");
    print(controller.filter.value);
    return StreamBuilder<QuerySnapshot>(
        stream: controller.getCasesUid(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.length == 0) {
            return Center(
                child: Text(
              "empty_cases".tr,
              style: TextStyle(fontSize: 16),
            ));
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index].data();
                var _case = Case.fromMap(data);
                _case.id = snapshot.data!.docs[index].id;
                return CaseCardStruct(_case);
              });
        });
  }

  Widget buildStreamRated() {
    print("build rated");
    return StreamBuilder<QuerySnapshot>(
        stream: controller.getCasesRated(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.length == 0) {
            return Center(
                child: Text(
                  "empty_cases".tr,
                  style: TextStyle(fontSize: 16),
                ));
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index].data();
                var _case = Case.fromMap(data);
                _case.id = snapshot.data!.docs[index].id;
                return CaseCardStruct(_case);
              });
        });
  }

  Widget buildStreamWaiting() {
    print("build waiting");
    return StreamBuilder<QuerySnapshot>(
        stream: controller.getCasesNoUid(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.length == 0) {
            return Center(
                child: Text(
                  "empty_cases".tr,
                  style: TextStyle(fontSize: 16),
                ));
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index].data();
                var _case = Case.fromMap(data);
                _case.id = snapshot.data!.docs[index].id;
                return CaseCardStruct(_case);
              });
        });
  }
}
