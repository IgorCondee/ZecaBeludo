import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/data/cart.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ChoiceModel extends Model{
  UserModel user;
  List<Cart> choices = [];

  bool isLoading = false;

  ChoiceModel(this.user){
    if(user.isLoggedIn()){
      _loadItems();
    }
  }

  static ChoiceModel of(BuildContext context) => ScopedModel.of<ChoiceModel>(context);

  void addIten(Cart cart){
    choices.add(cart);
    
    Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").add(cart.toMap()).then((value) => cart.cartId = value.documentID);

    notifyListeners();
  }

  void deleteIten(Cart cart){
    Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").document(cart.cartId).delete();

    choices.remove(cart);

    notifyListeners();
  }

  void deleteAll() async{
    isLoading = true;
    notifyListeners();

    QuerySnapshot query = await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").getDocuments();

    for(DocumentSnapshot doc in query.documents){
      doc.reference.delete();
    }

    choices.clear();

    isLoading = false;
    notifyListeners();
  }

  void _loadItems() async{
    QuerySnapshot query = await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").getDocuments();

    choices = query.documents.map((e) => Cart.fromDocument(e)).toList();

    notifyListeners();
  }

  Future<String> finishOrder() async{
    if(choices.length == 0) return null;

    isLoading = true;
    notifyListeners();

    double cost = getCost();

    DocumentReference refSchedules = await Firestore.instance.collection("schedules").add(
      {
        "clientId": user.firebaseUser.uid,
        "choices": choices.map((e) => e.toMap()).toList(),
        "total": cost,
      }
    );

    await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("schedules").document(refSchedules.documentID).setData(
      {
        "scheduleId": refSchedules.documentID,
      }
    );

    QuerySnapshot query = await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").getDocuments();

    for(DocumentSnapshot doc in query.documents){
      doc.reference.delete();
    }

    choices.clear();

    isLoading = false;
    notifyListeners();

    return refSchedules.documentID;
  }

  void updateCost(){
    notifyListeners();
  }

  double getCost(){
    double price = 0.0;

    for(Cart c in choices){
      if(c.choiceData != null){
        price += c.choiceData.price;
      }
    }

    return price;
  }

}