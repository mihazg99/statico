import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:statico/screens/auth/controllers/RegisterController.dart';
import 'package:statico/screens/auth/views/login/LoginView.dart';
import 'package:statico/screens/auth/views/register/widgets/buttons/RegCitizenBtn.dart';
import 'package:statico/screens/auth/views/register/widgets/buttons/RegForwardBtn.dart';
import 'package:statico/screens/auth/views/register/widgets/buttons/RegStructBtn.dart';
import 'package:statico/screens/auth/views/register/widgets/forms/RegFormOne.dart';
import 'package:statico/screens/auth/views/register/widgets/forms/RegFormThree.dart';
import 'package:statico/screens/auth/views/register/widgets/forms/RegFormTwo.dart';

class RegisterView extends StatelessWidget {
  final regController = Get.put(RegisterViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
            //regController.reset();

            Get.offAll(() => LoginView());
            return false;
          },
          child: buildBody()),
    );
  }

  Widget buildBody() {
    RegisterViewController regController = RegisterViewController.to;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              "Registracija",
              style: TextStyle(
                color: Color(
                  0xff131829,
                ),
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: "IBM Plex Sans",
                letterSpacing: 1.25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: PageView(
            controller: regController.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [Page1(), Page2(), Page3(), Page4()],
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              children: [
                Obx(() => AnimatedSmoothIndicator(
                      activeIndex: regController.index.value,
                      count: 4,
                      effect:
                          JumpingDotEffect(activeDotColor: Color(0xff0046b1)),
                    )),
                SizedBox(
                  height: 20,
                ),
                RegForwardBtn()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Page1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                RegCitizenBtn(),
                SizedBox(
                  height: 40,
                ),
                RegStructBtn()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Page2() {
    return SingleChildScrollView(
      child: RegFormOne(),
    );
  }

  Widget Page3() {
    return SingleChildScrollView(
      child: RegFormTwo(),
    );
  }

  Widget Page4() {
    RegisterViewController regController = RegisterViewController.to;
    return SingleChildScrollView(
      child: Column(
        children: [
          RegFormThree(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Prihvaćam da će moji podatci biti pohranjeni\ni korišteni isključivo u svrhe aplikacije",
                    style: TextStyle(
                        wordSpacing: 1.1, fontWeight: FontWeight.bold),
                  ),
                  width: 250,
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(
                  () => Switch(
                      value: regController.isConsent.value,
                      onChanged: (value) {
                        regController.isConsent.value = value;
                      }),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
