import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/cart.dart';
import 'package:loja_virtual/data/choice_data.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tile/service_tile.dart';

class CartTile extends StatelessWidget{
  final Cart cart;
  CartTile(this.cart);

  @override
  Widget build(BuildContext context) {

    Widget _buildContent(){
      ChoiceModel.of(context).updateCost();
      String category;
      bool place=false, professional=false, service=false;

      if(cart.categoryId == "places"){
        category = "Unidade";
        place = true;
      }else if(cart.categoryId == "professionals"){
        category = "Profissional";
        professional = true;
      }else if(cart.categoryId == "services"){
        category = "Serviço";
        service = true;
      }else if(cart.categoryId == "time"){
        category = "Data e Horário";
      }

      return Row(
        children: [
          Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cart.choiceData.name,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      FlatButton(
                        onPressed: (){
                          ChoiceModel.of(context).deleteIten(cart);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => HomeTab())
                          );
                        },
                        child: Text("Alterar"),
                        textColor: Colors.grey,
                      ),
                    ],
                  ),
                ],
              )
          ),
        ],
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: cart.choiceData == null ? 
        FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance.collection("options").document(cart.categoryId).collection("items").document(cart.optionId).get(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                cart.choiceData = ChoiceData.fromDocument(snapshot.data);
                return _buildContent();
              }else{
                return Container(
                  height: 70,
                  child: CircularProgressIndicator(),
                  alignment: Alignment.center,
                );
              }
            },
        ) :
          _buildContent()
    );
  }
}
