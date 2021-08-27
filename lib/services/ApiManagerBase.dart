import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ApiManagerBase{

  Future<void> signInWithEmail(String email, String password);
  Future<bool> registerWithEmail(String email,String password,String name,String surname,bool isStaticar,String city,String province,String oib,String address,String licence);
  Future<void> addUser(CollectionReference users, String uid, String name,String surname,bool isStaticar,String city, String province,String oib,String address,String licence);
  Future<bool> addCase(String address, String number, String description, String uid,List<String?> pics,String date,String objectType,double lat,double long);
  Future<void> updateCase(String? docId,String uid);
  Future<bool> rateCase(String docId,String uporabljivost,String label);
  Future<void> signOut();
  Future<bool> checkForOib(String oib); // metoda koja ce provjeravati da li je staticar u bazi podataka prilikom registracije


}