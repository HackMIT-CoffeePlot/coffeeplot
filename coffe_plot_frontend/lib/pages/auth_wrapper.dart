import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:coffe_plot_frontend/pages/home_page.dart';
import 'package:coffe_plot_frontend/pages/login_signup.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AuthHelper.isUserLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!) {
            return HomePage(); // Assuming you have a HomePage widget
          }
          return LoginSignupPage(); // Your login/signup page widget
        }
        return const CircularProgressIndicator(); // Show a loading indicator while checking
      },
    );
  }
}
