import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/data/cart.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ChoiceModel extends Model{
  UserModel user;
  List<Cart> choices = [];

  ChoiceModel(this.user);

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
}