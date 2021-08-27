import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';
import 'package:statico/services/ApiManager.dart';


class HomeCitzController extends GetxController{

  final AuthController authController = AuthController.to;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final ApiManager api = ApiManager();


  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  Stream<QuerySnapshot> getCases(String uid){
    return _db.collection('cases')
        .where('userId', isEqualTo: uid)
        .snapshots();
  }

}