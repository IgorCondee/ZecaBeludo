import 'package:flutter/material.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class CriarContaScreen extends StatefulWidget {
  @override
  _CriarContaScreenState createState() => _CriarContaScreenState();
}

class _CriarContaScreenState extends State<CriarContaScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _pass1Controller = TextEditingController();
  final _pass2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criação de Conta"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen())
              );
            },
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    hintText: "Nome",
                  ),
                  validator: (text){
                    if(text.isEmpty) return "Nome inválido";
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
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
                  controller: _telefoneController,
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
                  controller: _pass1Controller,
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
                  obscureText: true,
                  validator: (text){
                    if(text.isEmpty || text.length < 6) return "Senha inválido";
                  },
                ),
                /*SizedBox(height: 16),
                TextFormField(
                  controller: _pass2Controller,
                  decoration: InputDecoration(
                    hintText: "Confirmar senha",
                  ),
                  obscureText: true,
                  validator: (text){
                    if(text.isEmpty || text.length < 6) return "Senha inválido";
                  },
                ),*/
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
                        //Color(0xFFCD853F),
                        Color(0xFF696969),
                        Color(0xFFCD853F),
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
                        if(_formKey.currentState.validate()){
                          Map<String, dynamic> userData = {
                            "name": _nomeController.text,
                            "email": _emailController.text,
                            "phone": _telefoneController.text,
                          };

                          model.signUp(userData: userData, pass: _pass1Controller.text, onSuccess: _onSuccess, onFail: _onFail);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess(){

  }

  void _onFail(){

  }
}
