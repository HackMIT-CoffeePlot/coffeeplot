import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/pages/auth_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'GraphikLCG-Regular'),
      home: AuthWrapper(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/svgs/Group19.svg',
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/svgs/Group20.svg',
              color: Colors.grey,
            ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/svgs/Group21.svg',
              color: Colors.grey,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/svgs/Group22.svg',
              color: Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      )
    );
  }
}
