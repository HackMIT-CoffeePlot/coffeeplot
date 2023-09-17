import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFEFA),
      body: Container(
        child: Image(
          image: AssetImage('lib/svgs/stats-image.jpg'),
          fit: BoxFit.contain,//fill, //contain, cover, scaleDown, 
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
