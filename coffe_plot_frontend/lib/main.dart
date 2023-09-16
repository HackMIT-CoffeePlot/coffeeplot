import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/pages/auth_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'GraphikLCG-Regular'),
      home: AuthWrapper(),
    );
  }
}
