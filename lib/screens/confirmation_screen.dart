import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/home_tab.dart';

class ConfirmationScreen extends StatelessWidget {
  final String scheduleId;
  ConfirmationScreen(this.scheduleId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agendamento"),
        centerTitle: true,
        backgroundColor: Color(0xFFCD853F),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
              size: 80,
            ),
            Text(
              "Agendamento realizado com sucesso!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
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
