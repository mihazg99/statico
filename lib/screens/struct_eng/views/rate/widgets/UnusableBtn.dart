import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statico/misc/enums/LabelEnum.dart';
import 'package:statico/misc/enums/RateCase.dart';
import 'package:statico/screens/struct_eng/controllers/RateController.dart';

class UnusableBtn extends StatelessWidget {
  final RateController controller = RateController.to;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        print("tappp");
        controller.isUsable.value = false;
        controller.isUnusable.value = true;
        controller.isTemp.value = false;
        controller.rateEnum.value = RateCaseEnum.N1;
        controller.labelEnum.value = LabelEnum.NEUPORABLJIVO;
        print(controller.labelEnum.value .toString());
      },
      child: Obx(
            ()=>Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 100,
          decoration: BoxDecoration(
            color: Color(
              0xffBA3232,
            ),
            border: Border.all(
              color: controller.isUnusable.value ? Colors.black : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Center(
            child: Text(
              "NEUPORABLJIVO",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Lato",
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
