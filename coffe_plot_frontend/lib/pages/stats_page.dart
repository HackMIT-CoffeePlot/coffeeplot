import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats Page'),
      ),
      // body:  SvgPicture.asset(
      //         'lib/svgs/stats-image.svg',
      //         color: Colors.grey,
      //       ),
      body: Center(
        child: Image(
          image: AssetImage('lib/svgs/stats-image.jpg'),
        ),
      ),
    );
  }
}
