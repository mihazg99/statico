import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';
import 'package:statico/services/ApiManager.dart';

class HomeStructController extends GetxController {

  static HomeStructController to = Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String uid = Get.find<AuthController>().uid;
  final ApiManager api = ApiManager();

  ///varijabla na temelju koje se filtrira tok podataka baze
  var filter = "Ocijenjeno".obs;
  var homeText = "Štete na čekanju".obs;

  /// Vraća tok podataka s firestore baze. Vraća slučajeve koje je statičar prihvatio
  Stream<QuerySnapshot> getCasesUid() {
    return _db
        .collection('cases')
        .where('staticarId', isEqualTo: uid)
        .where('status', isEqualTo: "Accepted")
        .snapshots();
  }

  /// Vraća tok podataka s firestore baze. Vraća slučajeve na temelju filtera waiting
  Stream<QuerySnapshot> getCasesNoUid(){
    return _db.collection('cases')
        .where('status', isEqualTo: "waiting")
        .snapshots();
  }

  /// Vraća tok podataka s firestore baze. Vraća slučajeve na temelju filtera Ocijenjeno
  Stream<QuerySnapshot> getCasesRated(){
    return _db.collection('cases')
        .where('status', isEqualTo: "Ocijenjeno")
        .where('staticarId', isEqualTo: uid)
        .snapshots();
  }
}
