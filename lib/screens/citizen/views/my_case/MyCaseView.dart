import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:statico/misc/enums/LabelEnum.dart';
import 'package:statico/misc/enums/RateCase.dart';
import 'package:statico/models/Case.dart';
import 'package:get/get.dart';
import 'package:statico/ui_components/cards/Label.dart';
import 'package:statico/ui_components/cards/TempCardFinal.dart';
import 'package:statico/ui_components/cards/UnusableCardFinal.dart';
import 'package:statico/ui_components/cards/UsableCardFinal.dart';

class MyCaseView extends StatelessWidget {
  final Case _case = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BLUE,
        title: Text("appbar_case".tr),
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
              Label(_case.label),
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
                "date".tr + " : ${_case.date}",
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
                  ? Container(child: buildGridView(context))
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

  Widget buildGridView(context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: _case.pictures!.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          var mycase = _case.pictures![index];
          return Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  mycase,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
          );
        });
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
}
