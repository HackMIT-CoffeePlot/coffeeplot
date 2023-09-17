import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/pages/auth_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      title: 'Your App Title',
      theme: ThemeData(
          primarySwatch: Colors.blue, fontFamily: 'GraphikLCG-Regular'),
      home: AuthWrapper(),
    );
  }
}
