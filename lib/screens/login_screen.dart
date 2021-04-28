import 'package:flutter/material.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'criarconta_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return Container(
            padding: EdgeInsets.only(top: 60, right: 20, left: 20),
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      "images/logosemfundo.png",
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "E-mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      // ignore: missing_return
                      if(text.isEmpty || !text.contains("@")) return "E-mail inválido";
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Senha",
                    ),
                    obscureText: true,
                    // ignore: missing_return
                    validator: (text){
                      if(text.isEmpty || text.length < 6) return "Senha inválido";
                    },
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: (){

                      },
                      child: Text(
                        "Recuperar senha",
                        textAlign: TextAlign.right,
                      ),
                      textColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
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
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("images/pente.png"),
                                height: 28,
                                width: 28,
                              ),
                            ),
                          ],
                        ),
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => HomeScreen())
                            );
                            //model.signIn();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF3C5A99),
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
                              "Login com Facebook",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("images/pente.png"),
                                height: 28,
                                width: 28,
                              ),
                            ),
                          ],
                        ),
                        onPressed: (){

                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
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
                              "Criar Conta",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("images/pente.png"),
                                height: 28,
                                width: 28,
                              ),
                            ),
                          ],
                        ),
                        onPressed: (){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => CriarContaScreen())
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
