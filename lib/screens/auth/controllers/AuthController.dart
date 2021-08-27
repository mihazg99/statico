import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:statico/models/UserModel.dart';
import 'package:statico/screens/auth/views/login/LoginView.dart';
import 'package:statico/screens/citizen/views/home/HomeView.dart';
import 'package:statico/screens/struct_eng/views/home/HomeView.dart';
import 'package:statico/services/ApiManager.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final ApiManager api = ApiManager();

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) async {
    //dohvati podatke o korisniku
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
    }

    if (_firebaseUser == null) {
      print('Send to signin');
      Get.offAll(() => LoginView());
    } else {
      getUserModel().then((userData) {
        if (userData!.isStaticar == true) {
          Get.offAll(() => HomeStructView());
        } else {
          Get.offAll(() => HomeCitizenView());
        }
      });
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  String get uid => firebaseUser.value!.uid;

  Stream<UserModel> streamFirestoreUser() {
    print('streamFirestoreUser()');

    return _db
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()!));
  }

  Future<UserModel?> getUserModel() async {
    UserModel korisnik;
    return _db
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return korisnik = UserModel.fromMap(documentSnapshot.data()!);
      }
    }).catchError((error) => print("Korisnik nije dohvacen"));
  }
}
