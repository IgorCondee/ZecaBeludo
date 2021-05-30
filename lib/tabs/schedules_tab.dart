import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/tile/schedule_tile.dart';

import 'home_tab.dart';

class SchedulesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = UserModel.of(context).firebaseUser.uid;
    
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("users").document(uid).collection("schedules").getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Scaffold(
              appBar: AppBar(
                title: Text("Meus Agendamentos"),
                centerTitle: true,
                backgroundColor: Color(0xFFCD853F),
              ),
              body: Container(
                color: Color(0xFFFFDEAD),
                child: ListView(
                  children: snapshot.data.documents.map((e) => ScheduleTile(e.documentID)).toList(),
                ),
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
                    "Voltar",
                    textAlign: TextAlign.center,
                  ),
                  textColor: Colors.black,
                ),
              ),
            );
          }
        }
    );
  }
}
