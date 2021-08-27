import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:statico/services/ApiManagerBase.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';

class ApiManager implements ApiManagerBase{

  ApiManager();
  final _db = FirebaseFirestore.instance;

  ///metoda za prijavu u sustav pomocu emaila i lozinke
  @override
  Future<void> signInWithEmail(String email, String password) async{

    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar("error_title".tr, "no_email".tr);

      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar("error_title".tr, "wrong_pwd".tr);

      }else{
        Get.snackbar("error_title".tr, "no_network".tr);
      }
    }

  }


  ///metoda za registraciju korisnika u sustav preko emaila
  @override
  Future<bool> registerWithEmail(String email,String password,String name,String surname,bool isStaticar,String city,String province,String oib,String address,String licence) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      var uid = userCredential.user!.uid;
      CollectionReference users = _db.collection('users');

      isStaticar ?
      addUser(users,uid,name,surname,isStaticar,city,province,oib,address,""):
      addUser(users,uid,name,surname,isStaticar,city,province,oib,address,licence);



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar("error_title".tr, "error_weak_pass".tr);
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar("error_title".tr,"error_email_exist".tr);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }


  ///ova metoda dodaje novog korisnika u bazu nakon sto korisnik izvrsi registraciju, poziva se nakon register metode
  @override
  Future<void> addUser(CollectionReference users, String uid, String name,String surname,bool isStaticar,String city, String province,String oib,String address,String licence) {

    return users.doc(uid)
        .set({
      'name': name,
      'surname':surname,
      'isStaticar': isStaticar,
      'city':city,
      'province':province,
      'oib':oib,
      'licence':licence,
      'address':address
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  ///koristi se za dodavanje novog slucaja u bazu, obavezno je predati adresu,kontakt broj, id korisnika, prioritet,datum,geolokaciju i tip objekta
  Future<bool> addCase(String address, String number, String description, String uid,List<String?> pics,String date,String objectType,double lat,double long) async {
    CollectionReference cases = _db.collection('cases');
    String priority;

    Geoflutterfire geo = Geoflutterfire();
    GeoFirePoint point = geo.point(latitude: lat, longitude: long);

    objectType == "Javna ustanova" ?
    priority = "DA"  :
    priority ="NE";

    return await cases
        .add({
      'address': address,
      'number': number,
      'userId': uid,
      'staticarId' : "",
      'description':description,
      'label':"NIJE PREGLEDANO",
      'status':"waiting",
      'priority':priority,
      'objectType':objectType,
      'pictures':pics,
      'staticarDescription':"",
      'uporabljivost':"",
      'date': date,
      'position':point.data
    })
        .then((value){print("case Added");return true;})
        .catchError((error){print("Failed to add case: $error");return false;});
  }


  ///koristi se za ocijenjivanje slucaja, predaje se id dokumenta i id korisnika
  @override
  Future<void> updateCase(String? docId,String uid) {
    CollectionReference _cases = _db.collection('cases');
    return _cases
        .doc(docId)
        .update({'status': 'Accepted', 'staticarId': uid})
        .then((value) => print("Case Updated"))
        .catchError((error) => print("Failed to update case: $error"));
  }

  ///koristi se za ocijenjivanje slucaja, predaje se id dokumenta, ocjena uporabljivosti i ocjena slucaja
  @override
  Future<bool> rateCase(String docId, String uporabljivost, String label) {
    CollectionReference _cases = _db.collection('cases');
    return _cases
        .doc(docId)
        .update({'status': 'Ocijenjeno','uporabljivost':uporabljivost,'label':label})
        .then((value) { print("Case Updated");return true;})
        .catchError((error) {print("Failed to update case: $error");return false;});
  }

  /// metoda za odjavu iz sistema
  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }


  ///provjerava da li je staticar registriran u bazi staticara
  ///ovu metodu je potrebno implementirati u drugoj fazi razvoja
  @override
  Future<bool> checkForOib(String oib) {
    // TODO: implement checkForOib
    throw UnimplementedError();
  }
}