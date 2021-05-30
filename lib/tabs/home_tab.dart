import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/choice_data.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/screens/login_screen.dart';
import 'package:loja_virtual/screens/schedules_screen.dart';
import 'package:loja_virtual/tabs/places_tab.dart';
import 'package:loja_virtual/tabs/schedules_tab.dart';
import 'package:loja_virtual/tile/category_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTab extends StatelessWidget {

  /*final PageController pageController;
  final int page;
  HomeTab(this.pageController, this.page);*/


  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
    );
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("options").getDocuments(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }else{
                return ScopedModel<ChoiceModel>(
                  model: ChoiceModel(model),
                  child: Scaffold(
                    body: Container(
                      color: Color(0xFFFFDEAD),
                      child: ListView(
                        children: [
                          Container(
                            color: Color(0xFFCD853F),
                            //mainAxisAlignment: MainAxisAlignment.start,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5, left: 25, bottom: 15, right: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.exit_to_app),
                                    color: Colors.white,
                                    onPressed: (){
                                      model.signOut();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) => LoginScreen())
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Image.asset(
                            "images/logofinal.png",
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(height: 40),
                          Column(
                            children: snapshot.data.documents.map((doc) => CategoryTile(doc)).toList(),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 40,
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              child: Text(
                                "Limpar todas as seleções",
                                textAlign: TextAlign.right,
                              ),
                              onPressed: (){
                                ChoiceModel.of(context).deleteAll();
                                /*Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Seleções limpas!"),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(seconds: 2),
                                  )
                                );*/
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => HomeTab())
                                );
                              },
                            ),
                          ),
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
                                        "Meus Agendamentos",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF696969),
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Container(
                                        child: SizedBox(
                                          child: Image.asset("images/secador-de-cabelo.png"),
                                          height: 28,
                                          width: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => SchedulesTab())
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                    bottomNavigationBar: ScopedModelDescendant<ChoiceModel>(
                        builder: (context, child, model){
                          int p = model.choices.length;
                          return Container(
                            //padding: EdgeInsets.only(top: 60, right: 20, left: 20),
                            height: 60,
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
                            child: SizedBox.expand(
                              child: FlatButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Finalizar Agendamento ${p.toString()}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Container(
                                      child: SizedBox(
                                        child: Image.asset("images/perfume.png"),
                                        height: 28,
                                        width: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: (){
                                  if(p == 4){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => SchedulesScreen())
                                    );
                                  }else if(p < 4){
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Favor selecionar todos os itens!"),
                                          backgroundColor: Colors.redAccent,
                                          duration: Duration(seconds: 2),
                                        )
                                    );
                                  }else if(p > 4){
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Erro"),
                                          backgroundColor: Colors.redAccent,
                                          duration: Duration(seconds: 2),
                                        )
                                    );
                                  };
                                  /*Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => SchedulesScreen())
                                  );*/
                                },
                              ),
                            ),
                          );
                        }
                    )
                  ),
                );
              }
            },
          );
        }
    );
  }
}
