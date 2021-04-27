import 'package:flutter/material.dart';
import 'criarconta_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.,
      appBar: AppBar(
        title: Text("ENTRAR"),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: (){

              },
              child: Text(
                "Recuperar senha",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            textColor: Colors.black,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Image.asset(
              "images/logosemfundo.png",
              height: 200,
              width: 200,
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
                hintText: "Senha",
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
                child: Text("Entrar", style: TextStyle(fontSize: 18)),
                textColor: Colors.black,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: RaisedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CriarContaScreen())
                  );
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
