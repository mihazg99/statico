import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statico/screens/auth/controllers/RegisterController.dart';



class RegCitizenBtn extends StatelessWidget {

  final RegisterViewController regController = RegisterViewController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>InkWell(
        onTap: () {
          regController.isCitizen.value = !regController.isCitizen.value;
          regController.isStatic.value = false;

        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: regController.isCitizen.value
                  ? Color(
                0xff131829,
              )
                  : Color(
                0xffbcbcbc,
              ),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          width: MediaQuery.of(context).size.width - 50,
          height: 150,
          child: Center(
              child: Text(
                "Građanin",
                style: TextStyle(
                  color: regController.isCitizen.value
                      ? Color(
                    0xff131829,
                  )
                      : Color(
                    0xffbcbcbc,
                  ),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  letterSpacing: 1.25,
                ),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
