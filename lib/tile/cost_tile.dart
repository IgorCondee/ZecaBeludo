import 'package:flutter/material.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CostTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        child: ScopedModelDescendant<ChoiceModel>(
          builder: (context, child, model){
            double price = model.getCost();
            
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Total",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(height:  12),
                Text("R\$ ${price.toStringAsFixed(2)}", style: TextStyle(fontSize: 20),),
              ],
            );
          },
        ),
      ),
    );
  }
}
