import 'package:flutter/material.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTab extends StatelessWidget {

  final PageController pageController;
  final int page;
  HomeTab(this.pageController, this.page);


  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Agendamento de Serviços"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBodyBack(),
            Container(
              height: 375,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFFFDEAD),
                    Color(0xFF8B4513),
                  ],
                ),
                /*borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),*/
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ScopedModelDescendant<UserModel>(
                  builder: (context, child, model){
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 30, left: 10),
                            child: Text(
                              "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ]
                    );
                  },
                ),
                Image.asset(
                  "images/logosemfundo.png",
                  height: 200,
                  width: 200,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: SizedBox(
                    height: 50.0,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        pageController.jumpToPage(page);
                      },
                      color: Colors.amberAccent,
                      child: Text("ENTRAR"),
                      textColor: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
