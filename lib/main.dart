import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_screen.dart';
import 'package:loja_virtual/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbearia',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
      //home: HomeScreen(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Container(
          child: Image.asset(
            "images/logo.png",
            height: 500,
            width: 500,
          ),
          //child: Icon(Icons., size: 300.0, color: Colors.amberAccent),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen())
      );
    });
  }
}