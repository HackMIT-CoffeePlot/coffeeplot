import 'package:flutter/material.dart';
import './searchbar.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFEFA),
      body: ListView(children: <Widget>[
        //your content goes
        Center(child: BarSearch())
      ]),
    );
  }
}
