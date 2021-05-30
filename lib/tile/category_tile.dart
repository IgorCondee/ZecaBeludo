import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/choice_data.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:loja_virtual/tabs/date_tab.dart';
import 'package:loja_virtual/tabs/places_tab.dart';
import 'package:loja_virtual/tabs/services_tab.dart';
import 'package:loja_virtual/tabs/barber_tab.dart';
import 'package:loja_virtual/tabs/time_tab.dart';
import 'package:scoped_model/scoped_model.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  //final ChoiceData choice;
  CategoryTile(this.snapshot);

  bool place=false, professional, service;
  String local, teste;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ChoiceModel>(
        builder: (context, child, model){
          return Column(
            children: [
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.5],
                    colors: [
                      Color(0xFFCD853F),
                      Color(0xFF696969),
                    ],
                  ),
                ),
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF696969),
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "${teste == null ? "" : teste}"
                          ),
                          Container(
                            child: SizedBox(
                              child: Image.asset("images/tesouras.png"),
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ],
                      ),
                      onPressed: (){
                        if(snapshot.documentID == 'places'){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => PlacesTab(snapshot,local))
                          );
                        }if(snapshot.documentID == 'professionals'){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => BarberTab(snapshot))
                          );
                        }if(snapshot.documentID == 'services'){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => ServicesTab(snapshot))
                          );
                        }if(snapshot.documentID == 'time'){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => DateTab(snapshot))
                              //MaterialPageRoute(builder: (context) => TimeTab())
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}
