import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScheduleTile extends StatelessWidget {
  final String scheduleId;
  ScheduleTile(this.scheduleId);

  String _buildText(DocumentSnapshot snapshot){
    String text = "", opcao="";

    for(LinkedHashMap p in snapshot.data["choices"]){
      if(p["categoryId"] == "places"){
        text += "Unidade - ${p["choice"]["name"]}\n";
      }else if(p["categoryId"] == "professionals"){
        text += "Barbeiro - ${p["choice"]["name"]}\n";
      }else if(p["categoryId"] == "services"){
        text += "Serviço - ${p["choice"]["name"]}\n";
      }else if(p["categoryId"] == "time"){
        text += "Data e horário - ${p["choice"]["name"]}\n";
      }
    }

    text += "\nTotal: R\$ ${snapshot.data["total"].toStringAsFixed(2)}";

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance.collection("schedules").document(scheduleId).snapshots(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _buildText(snapshot.data),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
