import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:statico/misc/enums/LabelEnum.dart';
import 'package:statico/models/Case.dart';
import 'package:statico/screens/struct_eng/controllers/RateController.dart';
import 'package:statico/screens/struct_eng/views/rate/widgets/OnFieldForm.dart';
import 'package:statico/screens/struct_eng/views/rate/widgets/TempBtn.dart';
import 'package:statico/screens/struct_eng/views/rate/widgets/UnusableBtn.dart';
import 'package:statico/screens/struct_eng/views/rate/widgets/UsableBtn.dart';
import 'package:statico/services/ApiManager.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:statico/ui_components/btns/PrimaryBtn.dart';
import 'package:statico/ui_components/cards/TempCard.dart';
import 'package:statico/ui_components/cards/UnusableCard.dart';
import 'package:statico/ui_components/cards/UsableCard.dart';

class RateView extends StatelessWidget {
  final Case _case = Get.arguments;
  final RateController controller = Get.put(RateController());
  final ApiManager _api = ApiManager();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("rate".tr),
        backgroundColor: BLUE,
      ),
      body: buildBody(),
      bottomNavigationBar: BottomAppBar(
        color: BACKGROUND,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [PrimaryBtn(labelText: "rate".tr, onPressed: ()=>proccedToNextPage())],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: PageView(
                controller: controller.pageController,
                //physics: NeverScrollableScrollPhysics(),
                children: [Page1(), Page2(), Page3()],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Container(
              child: Column(
                children: [
                 Container(
                    child: SmoothPageIndicator(
                        controller: controller.pageController, // PageController
                        count: 3,
                        effect: WormEffect(
                            activeDotColor:
                            Color(0xff0046b1)),
                        onDotClicked: (index) {}),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget Page1() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          child: Center(
            child: OnFieldForm(),
          ),
        ),
      ),
    );
  }


  Widget Page2() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UsableBtn(),
          TempBtn(),
          UnusableBtn()
        ],
      ),
    );
  }

  Widget Page3() {
    return Container(
      child: Obx(
        ()=>Center(
          child: showCard(),
        ),
      ),
    );
  }

  void proccedToNextPage() {

    if (controller.pageController.page == 2) {
      RateController controller = RateController.to;
      _api.rateCase(_case.id!, EnumToString.convertToString(controller.rateEnum.value), EnumToString.convertToString(controller.labelEnum.value)).then((value){

        if(value){
          Get.back();
          Get.snackbar("success_title".tr, "rate_success".tr);
        }else{
          Get.snackbar("error_title".tr, "error_general".tr);
        }

      });
    }else{
      controller.pageController.nextPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  Widget showCard() {
    RateController controller = RateController.to;

    if(controller.labelEnum.value == LabelEnum.NEUPORABLJIVO){
      return UnusableCard();
    }else
    if (controller.labelEnum.value == LabelEnum.UPORABLJIVO) {
      return UsableCard();
    }else
    if (controller.labelEnum.value == LabelEnum.PRIVREMENO_NEUPORABLJIVO) {
      return TempCard();
    }
    return Text("Greska");
  }
}
