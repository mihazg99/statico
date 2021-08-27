import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statico/misc/enums/LabelEnum.dart';
import 'package:statico/misc/enums/RateCase.dart';
import 'package:statico/screens/struct_eng/controllers/RateController.dart';

class UsableBtn extends StatelessWidget {
  final RateController controller = RateController.to;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        controller.isUsable.value = true;
        controller.isUnusable.value = false;
        controller.isTemp.value = false;
        controller.rateEnum.value = RateCaseEnum.U;
        controller.labelEnum.value = LabelEnum.UPORABLJIVO;
      },
      child: Obx(
            ()=>Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 100,
          decoration: BoxDecoration(
            color: Color(
              0xff6EBA32,
            ),
            border: Border.all(
              color: controller.isUsable.value ? Colors.black : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Center(
            child: Text(
              "UPORABLJIVO",
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
