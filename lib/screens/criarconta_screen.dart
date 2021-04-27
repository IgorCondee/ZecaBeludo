import 'package:flutter/material.dart';

class CriarContaScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRIAÇÃO DE CONTA"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Nome",
              ),
              validator: (text){
                if(text.isEmpty) return "Nome inválido";
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty || !text.contains("@")) return "E-mail inválido";
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Telefone",
              ),
              keyboardType: TextInputType.phone,
              validator: (text){
                if(text.isEmpty) return "E-mail inválido";
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Senha",
              ),
              obscureText: true,
              validator: (text){
                if(text.isEmpty || text.length < 6) return "Senha inválido";
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Confirmar senha",
              ),
              obscureText: true,
              validator: (text){
                if(text.isEmpty || text.length < 6) return "Senha inválido";
              },
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){

                  }
                },
                child: Text("Criar Conta", style: TextStyle(fontSize: 18)),
                textColor: Colors.black,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
