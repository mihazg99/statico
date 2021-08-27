import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:statico/misc/enums/LabelEnum.dart';
import 'package:statico/misc/enums/RateCase.dart';
import 'package:statico/models/Case.dart';
import 'package:statico/screens/struct_eng/views/my_case/widgets/GridView.dart';
import 'package:statico/screens/struct_eng/views/rate/RateView.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:get/get.dart';
import 'package:statico/ui_components/btns/PrimaryBtn.dart';
import 'package:statico/ui_components/cards/Label.dart';
import 'package:statico/ui_components/cards/TempCardFinal.dart';
import 'package:statico/ui_components/cards/UnusableCardFinal.dart';
import 'package:statico/ui_components/cards/UsableCardFinal.dart';

class MyCase extends StatelessWidget {
  final Case _case = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appbar_case".tr),
        backgroundColor: BLUE,
      ),
      bottomNavigationBar: BottomAppBar(
        color: BACKGROUND,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryBtn(
                labelText: "rate".tr,
                onPressed: () {
                  if (_case.status != "Ocijenjeno") {
                    Get.to(() => RateView(), arguments: _case);
                  } else {
                    Get.snackbar("error_title".tr, "already_rated".tr);
                  }
                })
          ],
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Label(_case.label),
                InkWell(child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,3.0,8.0,0.0),
                  child: Image.asset("images/google.png",width: 45,height: 45,),
                ),onTap: ()=>checkMapsAndLaunch(),)
              ],),
              SizedBox(height: 12),
              Text(
                _case.address!,
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
                "date".tr+" : ${_case.date}",
                style: TextStyle(
                  color: Color(
                    0xdd000000,
                  ),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(height: 20),
              Text(
                _case.description!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(
                height: 35,
              ),
              _case.pictures!.isNotEmpty
                  ? Container(child: MyCaseGridView(_case))
                  : Text("no_images".tr),
              SizedBox(
                height: 50,
              ),
              getLabelCard()
            ],
          ),
        ),
      ),
    );
  }

  Widget getLabelCard() {
    if (_case.label == EnumToString.convertToString(LabelEnum.UPORABLJIVO)) {
      return UsableCardFinal(
          EnumToString.fromString(RateCaseEnum.values, _case.uporabljivost!)!);
    } else if (_case.label ==
        EnumToString.convertToString(LabelEnum.PRIVREMENO_NEUPORABLJIVO)) {
      return TempCardFinal(
          EnumToString.fromString(RateCaseEnum.values, _case.uporabljivost!)!);
    } else if (_case.label ==
        EnumToString.convertToString(LabelEnum.NEUPORABLJIVO)) {
      return UnusableCardFinal(
          EnumToString.fromString(RateCaseEnum.values, _case.uporabljivost!)!);
    }
    return Text("");
  }

  void checkMapsAndLaunch() async {
    final availableMaps = await MapLauncher.installedMaps;
    print(
        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    await availableMaps.first.showMarker(
      coords: Coords(_case.geoPoint!.latitude, _case.geoPoint!.longitude),
      title: _case.address!,
    );
  }
}
