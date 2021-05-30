import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/cart.dart';
import 'package:loja_virtual/data/choice_data.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/tabs/barber_tab.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  //final DocumentSnapshot snapshot;
  //PlaceTile(this.snapshot);
  final ChoiceData choice;

  String local;
  PlaceTile(this.choice, this.local);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              if(UserModel.of(context).isLoggedIn()){
                Cart cart = Cart();
                cart.optionId = choice.id;
                cart.categoryId = choice.category;
                cart.choiceData = choice;
                ChoiceModel.of(context).addIten(cart);
                local = choice.category;
              }else{
                //caso o user não esteja logado (opção entrar sem logar não implementada)
              }
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeTab())
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.network(
                    choice.image,
                    //snapshot.data["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        choice.name,
                        //snapshot.data["name"],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        choice.address,
                        //snapshot.data["address"],
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [
                  Color(0xFFCD853F),
                  Color(0xFF696969),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: (){
                  launch("https://www.google.com/maps/search/?api=1&query=${choice.lat},${choice.long}");
                },
                child: Text("Mapa"),
                textColor: Color(0xFF696969),
                padding: EdgeInsets.zero,
              ),
              FlatButton(
                onPressed: (){
                  launch("tel:${choice.phone}");
                },
                child: Text("Ligar"),
                textColor: Color(0xFF696969),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
