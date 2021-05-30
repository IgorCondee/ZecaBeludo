import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/choice_data.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tile/place_tile.dart';

class PlacesTab extends StatelessWidget {
  final DocumentSnapshot snapshot;

  String local;
  PlacesTab(this.snapshot, this.local);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      //future: Firestore.instance.collection("places").getDocuments(),
      future: Firestore.instance.collection("options").document(snapshot.documentID).collection("items").getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return Scaffold(
            appBar: AppBar(
              title: Text("Unidades"),
              centerTitle: true,
              backgroundColor: Color(0xFFCD853F),
            ),
            body: Container(
              color: Color(0xFFFFDEAD),
              child: ListView.builder(
                //padding: EdgeInsets.all(4),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){
                  ChoiceData data = ChoiceData.fromDocument(snapshot.data.documents[index]);
                  data.category = this.snapshot.documentID;
                  return PlaceTile(data, local);
                },
              ),
              /*child: ListView(
                children: snapshot.data.documents.map((doc) => PlaceTile(doc)).toList(),
              ),*/
            ),
            bottomNavigationBar: Container(
              height: 50,
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeTab())
                  );
                },
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                textColor: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}
