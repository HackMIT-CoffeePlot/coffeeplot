import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats Page'),
      ),
      backgroundColor: Color(0xFFFFFEFA),
      body: Center(
        child: Image(
          image: AssetImage('lib/svgs/stats-image.jpg'),
        ),
      ),
    );
  }
}
