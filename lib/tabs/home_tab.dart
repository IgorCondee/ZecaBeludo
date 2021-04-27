import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {

  final PageController pageController;
  final int page;
  HomeTab(this.pageController, this.page);


  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        color: Colors.white38,
      ),
    );
    return Stack(
      children: [
        _buildBodyBack(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.bathtub_outlined, size: 300.0, color: Colors.amberAccent),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: Container(
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
    );
  }
}
