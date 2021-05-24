import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/places_tab.dart';
import 'package:loja_virtual/tabs/services_tab.dart';
import 'package:loja_virtual/tabs/barber_tab.dart';


class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PlacesTab(snapshot))
                    );
                  }if(snapshot.documentID == 'professionals'){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BarberTab(snapshot))
                    );
                  }if(snapshot.documentID == 'services'){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ServicesTab(snapshot))
                    );
                  }if(snapshot.documentID == 'time'){

                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
