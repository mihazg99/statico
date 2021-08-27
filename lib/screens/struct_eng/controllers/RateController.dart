import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:statico/misc/enums/LabelEnum.dart';
import 'package:statico/misc/enums/RateCase.dart';

class RateController extends GetxController{

  static RateController to = Get.find();

  final key = GlobalKey<FormState>();
  TextEditingController onFieldReportController = TextEditingController();

  var index = 0.obs;
  var pageController = PageController(initialPage: 0);

  var isUsable = true.obs;
  var isTemp = false.obs;
  var isUnusable = false.obs;

  var labelEnum = LabelEnum.UPORABLJIVO.obs;
  var rateEnum = RateCaseEnum.U.obs;

 @override
  void onClose() {
    // TODO: implement onClose
   isUsable.value = true;
   isTemp.value = false;
   isUnusable.value = false;
   labelEnum.value = LabelEnum.UPORABLJIVO;
   rateEnum.value = RateCaseEnum.U;
   onFieldReportController.clear();
    super.onClose();
  }


}