import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:coffe_plot_frontend/pages/login_signup.dart';

class HomePage extends StatelessWidget {
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
      body: Center(child: Text('Welcome to Home Page!')),
    );
  }
}
