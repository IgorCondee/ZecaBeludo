import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/choice_data.dart';

class BarberTile extends StatelessWidget {
  final ChoiceData choice;

  BarberTile(this.choice);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                choice.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              choice.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onPressed: (){

        },
      ),
    );
  }
}
