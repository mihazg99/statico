import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:statico/screens/citizen/controllers/AddCaseController.dart';
import 'package:statico/screens/citizen/views/add_case/widgets/AddCaseForm.dart';
import 'package:statico/screens/citizen/views/add_case/widgets/AddCaseGridView.dart';
import 'package:statico/screens/citizen/views/add_case/widgets/SearchBox.dart';
import 'package:statico/screens/citizen/views/home/HomeView.dart';
import 'package:statico/ui_components/btns/PrimaryBtn.dart';

class AddCaseView extends StatelessWidget {
  final controller = Get.put(AddCaseController());

  @override
  Widget build(BuildContext context) {
    AddCaseController controller = AddCaseController.to;
    return WillPopScope(
      onWillPop: () async {
        controller.reset();
        Get.offAll(() => HomeCitizenView());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("new_case_title".tr),backgroundColor: BLUE,),
        bottomNavigationBar: BottomAppBar(
          color: BACKGROUND,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryBtn(
                  labelText: "submit_case".tr,
                  onPressed: () {
                    if (controller.formKey.currentState!.validate() &&
                        controller.address.value != "Pronađite svoju adresu" &&
                        controller.isNumber == true) {
                      controller.submitCase();
                    } else {
                      if (controller.isNumber == false) {
                        Get.snackbar("error_title".tr, "no_address_number".tr);
                      } else {
                        Get.snackbar("error_title".tr, "no_address".tr);
                      }
                    }
                  })
            ],
          ),
        ),
        body: caseBody(),
      ),
    );
  }

  Widget caseBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SearchBox(),
              SizedBox(
                height: 25,
              ),
           //   Text(
             //   "region".tr,
             //   style: TextStyle(
              //    color: Color(0xff131829),
               //   fontSize: 14,
               // ),
              //),
             // SizedBox(
               // height: 5,
              //),
              //buildRegionDropDown(),
              Text(
                "object_type".tr,
                style: TextStyle(
                  color: Color(0xff131829),
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              buildTypeDropDown(),
              SizedBox(height: 15),
              AddCaseForm(),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.photo),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "pictures".tr,
                    style: TextStyle(
                      color: Color(0xff131829),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              AddCaseGridView(),
            ],
          ),
        ),
      ),
    );
  }

  // Icon inside the type dropdown menu item

  Widget getIcon(String text) {
    if (text == "Kuća") {
      return Icon(Icons.home);
    } else if (text == "Stambena zgrada") {
      return Icon(Icons.apartment);
    } else {
      return Icon(Icons.local_hospital);
    }
  }

  Widget buildRegionDropDown() {
    AddCaseController controller = AddCaseController.to;
    return Obx(
      () => DropdownButton<String>(
        value: controller.region.value,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          controller.region.value = newValue!;
        },
        items:
            controller.regionList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 16.0),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildTypeDropDown() {
    return Obx(
      () => DropdownButton<String>(
        value: controller.objectType.value,
        icon: const Icon(Icons.arrow_downward),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        onChanged: (String? newValue) {
          controller.objectType.value = newValue!;
        },
        items: <String>['Kuća', 'Stambena zgrada', 'Javna ustanova']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                getIcon(value),
                SizedBox(
                  width: 10,
                ),
                Text(value, style: TextStyle(fontSize: 16.0))
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
