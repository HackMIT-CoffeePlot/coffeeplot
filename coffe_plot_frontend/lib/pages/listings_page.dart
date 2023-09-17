import 'package:flutter/material.dart';

class ListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listing Page',
            style: TextStyle(color: Color(0xFF36342F), fontSize: 24.0)
            
        ),
      ),
      
      backgroundColor: Color(0xFFFFFEFA),
      body: ListView(children: <Widget>[
        //your content goes
        Center(child: Text('Listing Page'))
      ]),
    );
  }
}
