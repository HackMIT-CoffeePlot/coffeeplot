import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/pages/auth_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      title: 'Coffee Plot',
      theme: ThemeData(
          primarySwatch: Color(0xFFFFFEFA), fontFamily: 'GraphikLCG-Regular'),
      home: AuthWrapper(),
    );
  }
}
