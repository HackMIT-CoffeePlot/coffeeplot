import 'package:flutter/material.dart';
import './searchbar.dart';

class ListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFEFA),
      body: ListView(children: <Widget>[
        //your content goes
        Center(child: BarSearch()),
        Align(
          alignment: Alignment.centerRight, // Align the text to the right
          child: Text(
            'Near Me',
            style: TextStyle(
              fontFamily: 'GraphikLCG-Semibold', // Use the font family name
            ),
          ), // Add this line
        ),
      ]),
    );
  }
}
