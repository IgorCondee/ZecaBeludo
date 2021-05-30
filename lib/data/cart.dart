import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/data/choice_data.dart';

class Cart{
  String cartId;
  String categoryId;
  String optionId;

  ChoiceData choiceData;

  Cart();

  Cart.fromDocument(DocumentSnapshot document){
    cartId = document.documentID;
    categoryId = document.data["categoryId"];
    optionId = document.data["optionId"];
  }

  Map<String, dynamic> toMap(){
    return{
      "categoryId": categoryId,
      "optionId": optionId,
      "choice": choiceData.toResumeMap()
    };
  }
}