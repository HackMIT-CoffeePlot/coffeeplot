import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:flutter/material.dart';
import './searchbar.dart';

class ListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFFEFA),
      body: ListView(children: <Widget>[
        //your content goes here
        Center(
          child: Container(
            width: deviceSize.width * 0.9, // adjust size using 0.x where x is a decimal number between 0 and 1
            // height: deviceSize.height * 0.x, (Uncomment and adjust if you also want to adjust the height)
            child: BarSearch(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft, // Align the text to the right
          child: Text(
            'Near Me',
            style: TextStyle(
              color: Colors.green,
              fontSize: 40,
              fontFamily: 'GraphikLCG-Semibold', // Use the font family name
            ),
          ), // Add this line
        ),
      ]),
    );
  }
}
