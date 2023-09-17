import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:coffe_plot_frontend/pages/home_page.dart';
import 'package:coffe_plot_frontend/services/api.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  // For the DropdownButton
  String? _selectedAccountType;
  final List<String> _accountTypes = ['Personal Account', 'Business Account'];

  Future<void> _login(BuildContext context) async {
    final response = await _apiService.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (response.containsKey('token')) {
      await AuthHelper.setToken(response['token']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Handle any errors that might come up
      print("Error logging in: ${response['error']}");
    }
  }

  Future<void> _signup(BuildContext context) async {
    print(_selectedAccountType);
    if (_selectedAccountType == null) {
      print("Account type not selected");
      return;
    }

    final response = await _apiService.signup(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
      _selectedAccountType!, // Add this line
    );

    if (response.containsKey('token')) {
      await AuthHelper.setToken(response['token']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Handle any errors that might come up
      print("Error signing up: ${response['error']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login/Signup')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Account Type'),
              obscureText: true,
            ),
            // Drop down menu with options Personal Account, and Business Account
            DropdownButton<String>(
              value: _selectedAccountType,
              hint: Text('Select Account Type'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAccountType = newValue;
                });
              },
              items:
                  _accountTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () => _login(context),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Signup'),
              onPressed: () => _signup(context),
            ),
          ],
        ),
      ),
    );
  }
}
