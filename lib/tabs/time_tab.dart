import 'package:flutter/material.dart';
import 'package:loja_virtual/model/choice_model.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:scoped_model/scoped_model.dart';


class TimeTab extends StatefulWidget {
  @override
  _TimeTabState createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  DateTime _dateTime;
  final _hourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ChoiceModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          else{
            return Scaffold(
              appBar: AppBar(
                title: Text("Time Tab"),
                centerTitle: true,
                backgroundColor: Color(0xFFCD853F),
              ),
              body: Container(
                  color: Color(0xFFFFDEAD),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        "Dia",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF696969),
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(_dateTime == null ? 'Nenhuma data' : _dateTime.toString()),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: FlatButton(
                              child: Text("Escolha o dia"),
                              onPressed: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2022),
                                ).then((date){
                                  setState(() {
                                    _dateTime = date;
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Horário",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF696969),
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _hourController,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (text){
                          if(text.isEmpty || !text.contains("@")) return "E-mail inválido";
                        },
                      ),
                    ],
                  )
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
        }
    );
  }
}
