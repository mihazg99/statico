import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  String? id;
  bool? isStaticar;
  String? name;
  String? lastname;
  String? address;
  String? oib;
  String? email;
  String? licence;
  String? city;
  String? province;


  UserModel(this.id, this.isStaticar, this.name, this.lastname, this.address,
      this.oib, this.email, this.licence, this.city, this.province);

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    isStaticar = documentSnapshot["isStaticar"];
    lastname = documentSnapshot["surname"];
    address = documentSnapshot["address"];
    oib = documentSnapshot["oib"];
    licence = documentSnapshot["licence"];
    city = documentSnapshot["city"];
    province = documentSnapshot["province"];
  }

  UserModel.fromMap(Map<String, dynamic> data){
      isStaticar = data['isStaticar'];
      name = data['name'];
      lastname = data['surname'];
      address = data['address'];
      oib = data['oib'];
      email = data['email'];
      licence = data['licence'];
      city = data['city'];
      province = data['province'];
  }

}