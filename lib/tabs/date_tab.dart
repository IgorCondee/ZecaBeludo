import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/choice_data.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tile/time_tile.dart';

class DateTab extends StatefulWidget {
  final DocumentSnapshot snapshot;
  DateTab(this.snapshot);

  @override
  _DateTabState createState() => _DateTabState(snapshot);
}

class _DateTabState extends State<DateTab> {
  final DocumentSnapshot snapshot;
  _DateTabState(this.snapshot);
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("options").document(snapshot.documentID).collection("items").getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else{
            return Scaffold(
              appBar: AppBar(
                title: Text("Date Tab"),
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
                      SizedBox(
                        height: 500,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.7,
                          ),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index){
                            ChoiceData data = ChoiceData.fromDocument(snapshot.data.documents[index]);
                            data.category = this.snapshot.documentID;
                            if(_dateTime == null){
                              return null;
                            }else{
                              return TimeTile(data);
                            }
                          },
                        ),
                      )
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


/*class DateTab extends StatelessWidget {
  final DocumentSnapshot snapshot;
  DateTab(this.snapshot);
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("options").document(snapshot.documentID).collection("items").getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else{
            return Scaffold(
              appBar: AppBar(
                title: Text("Data e hora"),
                centerTitle: true,
                backgroundColor: Color(0xFFCD853F),
              ),
              body: Container(
                color: Color(0xFFFFDEAD),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_dateTime == null ? 'Nenhuma data' : _dateTime.toString()),
                    RaisedButton(
                      child: Text("Escolha uma data"),
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
                    Text(
                      "Horários",
                    ),
                    SizedBox(
                      height: 500,
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index){
                          ChoiceData data = ChoiceData.fromDocument(snapshot.data.documents[index]);
                          data.category = this.snapshot.documentID;
                          return TimeTile(data);
                        },
                      ),
                    )
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
*/