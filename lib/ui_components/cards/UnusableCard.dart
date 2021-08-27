import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statico/misc/enums/RateCase.dart';
import 'package:statico/screens/struct_eng/controllers/RateController.dart';

class UnusableCard extends StatelessWidget {

  final controller = RateController.to;

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
              Row(
                children: [
                  SizedBox(width: 10,),
                  Radio(
                    value: RateCaseEnum.N1,
                    groupValue: controller.rateEnum.value,
                    onChanged: (RateCaseEnum? value) {
                      controller.rateEnum.value = value!;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(padding: EdgeInsets.all(12.0),
                    child: Text(
                      "N1",textAlign: TextAlign.center,
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
                  Container(padding: EdgeInsets.all(12.0),
                    child: Text(
                      "zbog\nVANJSKOG UTJECAJA",
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
              SizedBox(height:15),
              //ROW 2
              Row(
                children: [
                  SizedBox(width: 10,),
                  Radio(
                    value: RateCaseEnum.PN2,
                    groupValue: controller.rateEnum.value,
                    onChanged: (RateCaseEnum? value) {
                      controller.rateEnum.value = value!;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(padding: EdgeInsets.all(12.0),
                    child: Text(
                      "N2",textAlign: TextAlign.center,
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
                  Container(padding: EdgeInsets.all(12.0),
                    child: Text(
                      "zbog\nOŠTEĆENJA",
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
              SizedBox(height: 15,),
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
          height: 270,
          decoration: BoxDecoration(
              color: Color(
                0xffBA3232,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ))),
    );
  }
}
