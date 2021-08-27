import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';
import 'package:statico/screens/auth/views/login/LoginView.dart';


class RegisterViewController extends GetxController{

  static RegisterViewController to = Get.find();

  final AuthController authController = AuthController.to;

  PageController pageController = PageController(initialPage: 0);
  var index = 0.obs;

  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var formKey3 = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController oibController = TextEditingController();
  TextEditingController licenceController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String? name;
  String? surname;
  String? oib;
  String? city;
  String? province;
  String? address;
  String? email;
  String? password;
  String licence = "";

  var isStatic = false.obs;
  var isCitizen = true.obs;
  var isConsent = false.obs;


  @override
  void onClose() {
    reset();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
     emailController = TextEditingController();
     passController = TextEditingController();
     repassController = TextEditingController();
     nameController = TextEditingController();
     surnameController = TextEditingController();
     addressController = TextEditingController();
     oibController = TextEditingController();
     licenceController = TextEditingController();
     provinceController = TextEditingController();
     cityController = TextEditingController();
     pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void register(){
    authController.api.registerWithEmail(email!, password!, name!, surname!, isStatic.value, city!, province!, oib!, address!,licence).then((value){
      if(value == true){
        Get.offAll(()=>LoginView());
      }else{
        Get.snackbar("error_title".tr,"register_failed".tr);
      }
    });
  }

  void reset(){
    emailController.clear();
    passController.clear();
    repassController.clear();
    nameController.clear();
    provinceController.clear();
    cityController.clear();
    addressController.clear();
    oibController.clear();
    surnameController.clear();
    index.value = 0;
    isConsent.value = false;
    print("register controller cleared!");
  }

}