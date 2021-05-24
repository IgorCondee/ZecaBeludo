import 'package:cloud_firestore/cloud_firestore.dart';

class ChoiceData{
  String id;
  String name;
  String category;

  String image;
  String address;
  String phone;
  String lat;
  String long;

  double price;

  ChoiceData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    name = snapshot.data["name"];
    image = snapshot.data["image"];
    address = snapshot.data["address"];
    phone = snapshot.data["phone"];
    lat = snapshot.data["lat"];
    long = snapshot.data["long"];
    price = snapshot.data["price"] + 0.0;
  }

  Map<String, dynamic> toResumeMap(){
    return{
      "name": name,
    };
  }
}