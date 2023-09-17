import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:coffe_plot_frontend/pages/login_signup.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  final LatLng _center = const LatLng(37.4219999, -122.0840575);  // Default to GooglePlex

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthHelper.removeToken(); // remove the token
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginSignupPage()),
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
