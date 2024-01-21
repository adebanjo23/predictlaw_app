import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameTEC = TextEditingController();

  Future<void> _showErrorDialog(String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    String username = _usernameTEC.text.trim();

    if (username.isEmpty) {
      _showErrorDialog("Please enter a username.");
      return;
    }

    final String apiUrl = "https://predictlaw-backend.onrender.com/user/login/";

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'username': username,
      });

      if (response.statusCode == 200) {
        // Login successful
        _showSuccessDialog("Data is correct, login successful");
        // Navigate to /home route
      } else if (response.statusCode == 406) {
        // User not active
        _showInactiveUserDialog();
        // Navigate to /activate route
      } else {
        print(response.statusCode);
        // Other errors
        _showErrorDialog("Please check username to ensure it's valid.");
      }
    } catch (error) {
      // Handle network errors
      _showErrorDialog("An error occurred. Please try again.");
    }
  }

  Future<void> _showSuccessDialog(String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/select_model');
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showInactiveUserDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Inactive User"),
          content: const Text("The entered user is not active."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to /activate route
                Navigator.pushReplacementNamed(context, '/activate');
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/register/background.png', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Enter your username to login",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox( height:
                  50,),
                  const Row(
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: Colors.white ),
                    ),
                    child: Center(
                        child: TextField(
                          controller: _usernameTEC,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            color: Colors.white, // Set the text color to white
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                            hintText: "Enter your username",
                            hintStyle: TextStyle(
                              color: Colors.white, // Set the hint text color to white
                            ),
                            border: InputBorder.none,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: _login,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
