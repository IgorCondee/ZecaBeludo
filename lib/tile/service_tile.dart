import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/cart.dart';
import 'package:loja_virtual/data/choice_data.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/tabs/home_tab.dart';

class ServiceTile extends StatelessWidget {
  final ChoiceData choice;

  ServiceTile(this.choice);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  choice.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "R\$ ${choice.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            onPressed: (){
              if(UserModel.of(context).isLoggedIn()){
                Cart cart = Cart();
                cart.optionId = choice.id;
                cart.categoryId = choice.category;
                cart.choiceData = choice;
                ChoiceModel.of(context).addIten(cart);
              }else{
                //caso o user não esteja logado (opção entrar sem logar não implementada)
              }
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeTab())
              );
            },
          ),
        ],
      ),
    );
  }
}
