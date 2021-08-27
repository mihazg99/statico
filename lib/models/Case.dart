import 'package:cloud_firestore/cloud_firestore.dart';

class Case{
  String? id;
  String? address;
  int? evaluate;
  String? description;
  String? staticarDescription;
  String? userId;
  String? staticarId;
  String? label;
  String? status;
  String? contact;
  String? priority;
  String? objectType;
  String? uporabljivost;
  String? date;
  List<dynamic>? pictures;
  GeoPoint? geoPoint;


  Case(this.id,this.address, this.description, this.status,this.label,this.staticarId,this.staticarDescription,this.priority,this.objectType,this.pictures,this.uporabljivost,this.date,this.geoPoint);

  Case.fromMap(Map<String, dynamic> map){
    address = map['address'];
    evaluate = map['evaluate'];
    description = map['description'];
    staticarId = map['staticarId'];
    label = map['label'];
    status = map['status'];
    userId = map['userId'];
    staticarDescription = map['staticarDescription'];
    contact = map['number'];
    priority = map['priority'];
    pictures = map['pictures'];
    uporabljivost = map['uporabljivost'];
    date = map['date'];
    objectType = map['objectType'];
    geoPoint = map['position']['geopoint'];

  }

}