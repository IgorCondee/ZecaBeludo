import 'package:flutter/material.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:loja_virtual/screens/confirmation_screen.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tile/cart_tile.dart';
import 'package:loja_virtual/tile/cost_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class SchedulesScreen extends StatelessWidget {
  bool confirm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agendamento"),
        centerTitle: true,
        backgroundColor: Color(0xFFCD853F),
      ),
      body: Container(
        color: Color(0xFFFFDEAD),
        child: ScopedModelDescendant<ChoiceModel>(
          builder: (context, child, model){
            /*int p = model.choices.length;
            return Text("${p.toString()}");*/
            if(model.isLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return ListView(
                children: [
                  Column(
                    children: model.choices.map((e) => CartTile(e)).toList(),
                  ),
                  SizedBox(height:  30),
                  CostTile(),
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.only(top: 60, right: 20, left: 20),
        height: 100,
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
          child: ScopedModelDescendant<ChoiceModel>(
              builder: (context, child, model){
                if(model.isLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: SizedBox(
                            child: Image.asset("images/salao.png"),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Text(
                          "Confirmar Agendamento",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("images/salao.png"),
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async{
                      String scheduleId = await model.finishOrder();
                      if(scheduleId != null){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => ConfirmationScreen(scheduleId)),
                        );
                      }
                    },
                  );
                }
              }
          )
        ),
      ),
    );
  }
}
