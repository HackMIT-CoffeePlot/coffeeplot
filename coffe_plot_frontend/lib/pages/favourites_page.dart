import 'package:flutter/material.dart';
import './searchbar.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFFEFA),
      body: ListView(children: <Widget>[
        //your content goes here
        Center(
          child: Container(
            width: deviceSize.width * 0.9,  // adjust size using 0.x where x is a decimal number between 0 and 1
            // height: deviceSize.height * 0.x, (Uncomment and adjust if you also want to adjust the height)
            child: BarSearch(),
          ),
        )
      ]),
    );
  }
}