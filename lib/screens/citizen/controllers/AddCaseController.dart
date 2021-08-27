import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:statico/misc/constants/Regions.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';
import 'package:statico/screens/citizen/views/home/HomeView.dart';
import 'package:statico/services/ApiManager.dart';
import 'package:intl/intl.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class AddCaseController extends GetxController {
  static AddCaseController to = Get.find();

  final ApiManager api = ApiManager();
  final apiKey = "AIzaSyC8gc6JYPXmgdqh3qlNkj9C04CCNE0TYwo";

  final picker = ImagePicker();
  var images = [].obs;
  List<String?> urls = [];

  var formKey = GlobalKey<FormState>();
  var currentIndex = 0.obs;
  var objectType = "Kuća".obs;
  var address = "Pronađite svoju adresu".obs;
  var isNumber = true;
  var region = GRAD_ZAGREB.obs;
  var regionList = [
    GRAD_ZAGREB,
    ZAGREBACKA,
    KRAPINSKO_ZAGORSKA,
    SISACKO_MOSLOVACKA,
    KARLOVACKA,
    VARAZDINSKA,
    KOPRIVNICKO_KRIZEVACKA,
    BJELOVARSKO_BILOGORSKA,
    PRIMORSKO_GORANSKA,
    LICKO_SENJSKA,
    VIROVITICKO_PODRAVSKA,
    POZESKO_SLAVONSKA,
    BRODSKO_POSAVSKA,
    ZADARSKA,
    OSJECKO_BARANJSKA,
    SIBENSKO_KNINSKA,
    VUKOVARSKO_SRIJEMSKA,
    SPLITSKO_DALMATINSKA,
    ISTARSKA,
    DUBROVACKO_NERETVANSKA,
    MEDIMURSKA
  ];

  double? lat;
  double? long;

  TextEditingController contactController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  submitCase() {
    var _formatted = DateFormat.yMd().add_Hm().format(DateTime.now());
    api
        .addCase(
            address.value,
            contactController.text,
            descriptionController.text,
            Get.find<AuthController>().uid,
            urls,
            _formatted.toString(),
            objectType.value,
            lat!,
            long!)
        .then((value) {
      if (value == true) {
        reset();
        Get.offAll(() => HomeCitizenView());
      } else {
        Get.snackbar("error_title".tr, "error_general".tr);
      }
    });
  }

  void reset() {
    currentIndex.value = 0;
    descriptionController.clear();
    contactController.clear();
    address.value = "Pronađite svoju adresu";
    images[0] = 'Add image';
    images[1] = 'Add image';
    images[2] = 'Add image';
    images[3] = 'Add image';
    isNumber = true;
    lat = 0.0;
    long = 0.0;
  }

  Future<Null> displayPrediction(Prediction? p) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: apiKey,
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );

      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      String _address = detail.result.formattedAddress!;
      final _lat = detail.result.geometry!.location.lat;
      final _lng = detail.result.geometry!.location.lng;
      var adrComponentList = detail.result.addressComponents;
      var adrList = _address.split(",");

      adrComponentList[0].shortName.isNum ? isNumber = true : isNumber = false;

      address.value = adrList.first;
      lat = _lat;
      long = _lng;
    }
  }

  @override
  void onInit() {
    images.add("add image");
    images.add("add image");
    images.add("add image");
    images.add("add image");
    super.onInit();
  }
}
