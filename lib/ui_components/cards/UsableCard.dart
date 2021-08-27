import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statico/misc/enums/RateCase.dart';
import 'package:statico/screens/struct_eng/controllers/RateController.dart';


class UsableCard extends StatelessWidget {

  final RateController controller = RateController.to;
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Color(
                      0xfff1eeee,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
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
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Radio(
                    value: RateCaseEnum.U,
                    groupValue: controller.rateEnum.value,
                    onChanged: (RateCaseEnum? value) {
                      controller.rateEnum.value = value!;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "U",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lato",
                      ),
                    ),
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(
                        0xfff1eeee,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "bez\nOGRANIČENJA",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lato",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(
                        0xfff1eeee,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "PROVEDEN BRZI PREGLED",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lato",
                ),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width - 20,
          height: 200,
          decoration: BoxDecoration(
              color: Color(
                0xff6EBA32,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ))),
    );
  }
}
