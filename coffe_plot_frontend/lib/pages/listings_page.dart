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
            width: deviceSize.width *
                0.9, // adjust size using 0.x where x is a decimal number between 0 and 1
            // height: deviceSize.height * 0.x, (Uncomment and adjust if you also want to adjust the height)
            child: BarSearch(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Near you',
            style: TextStyle(
              color: Color(0xFF7AA987),
              fontSize: 40,
              fontFamily: 'Recoleta-SemiBold', // Use the font family name
            ),
          ), // Add this line
        ),
        Center(
          child: Container(
            child: Image(
              image: AssetImage('lib/svgs/list-element-1.jpg'),
              fit: BoxFit.contain, //fill, //contain, cover, scaleDown,
            ),
          ),
        ),
        Center(
          child: Container(
            child: Image(
              image: AssetImage('lib/svgs/list-element-2.jpg'),
              fit: BoxFit.contain, //fill, //contain, cover, scaleDown,
            ),
          ),
        ),
        Center(
          child: Container(
            child: Image(
              image: AssetImage('lib/svgs/list-element-3.jpg'),
              fit: BoxFit.contain, //fill, //contain, cover, scaleDown,
            ),
          ),
        ),
        Center(
          child: Container(
            child: Image(
              image: AssetImage('lib/svgs/list-element-4.jpg'),
              fit: BoxFit.contain, //fill, //contain, cover, scaleDown,
            ),
          ),
        ),
        Center(
          child: Container(
            child: Image(
              image: AssetImage('lib/svgs/list-element-5.jpg'),
              fit: BoxFit.contain, //fill, //contain, cover, scaleDown,
            ),
          ),
        ),
        Center(
          child: Container(
            child: Image(
              image: AssetImage('lib/svgs/list-element-6.jpg'),
              fit: BoxFit.contain, //fill, //contain, cover, scaleDown,
            ),
          ),
        ),
        Center(
          child: Container(
            child: Image(
              image: AssetImage('lib/svgs/list-element-7.jpg'),
              fit: BoxFit.contain, //fill, //contain, cover, scaleDown,
            ),
          ),
        ),
      ]),
    );
  }
}
