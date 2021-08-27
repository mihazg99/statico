import 'package:flutter/material.dart';
import 'package:statico/screens/auth/controllers/RegisterController.dart';
import 'package:get/get.dart';

class RegForwardBtn extends StatelessWidget {
  final RegisterViewController controller = RegisterViewController.to;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => proccedToNextPage(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: Color(
            0xff0046b1,
          ),
        ),
        width: MediaQuery.of(context).size.width - 50,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dalje",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
                letterSpacing: 1.25,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 5,),
            Icon(Icons.arrow_forward,color: Colors.white,)
          ],
        ),
      ),
    );
  }

  void proccedToNextPage() {
    if (controller.index.value == 0) {
      if((controller.isStatic.value == true && controller.isCitizen.value == false ) ||(controller.isStatic.value == false && controller.isCitizen.value == true ) ){
        controller.index.value++;
        controller.pageController.nextPage(
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      }else{

      }

    } else if (controller.index.value == 1) {
      if (controller.formKey1.currentState!.validate()) {
        controller.index.value++;
        controller.name = controller.nameController.text;
        controller.surname = controller.surnameController.text;
        controller.oib = controller.oibController.text;

        controller.pageController.nextPage(
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      }
    } else if (controller.index.value == 2) {
      if (controller.formKey2.currentState!.validate()) {

        controller.index.value++;
        controller.city = controller.cityController.text;
        controller.province = controller.provinceController.text;
        controller.address = controller.addressController.text;

        controller.pageController.nextPage(
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      }
    }else if(controller.index.value == 3){
      if(controller.formKey3.currentState!.validate()){
        controller.email = controller.emailController.text;
        controller.password = controller.passController.text;

        controller.isConsent.value ? controller.register() :
        Get.snackbar("Privatnost","Niste prihvatili uvjete korištenja");

      }
    }
  }
}
