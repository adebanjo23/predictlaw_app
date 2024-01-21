import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RegisterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameTEC = TextEditingController();
  final TextEditingController _phoneTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  bool _isResendActivationEnabled = false;

  Future<void> _registerUser() async {
    final String url = 'https://predictlaw-backend.onrender.com/user/signup/';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': _usernameTEC.text,
          'phone': _phoneTEC.text,
          'email': _emailTEC.text,
        },
      );

      // String errorMessage = jsonDecode(response.body)['error'] ?? 'Unknown error';

      if (response.statusCode == 200 || response.statusCode == 201) {
        _showSuccessDialog('Registration successful. Please activate your account from your email before logging in.');
      } else if (response.statusCode == 503) {
        await _resendActivationLink();
      } else {
        _showErrorDialog('Unable to create the user. Username or email already exists.');
      }
    } catch (e) {
      print(e);
      _showErrorDialog('Error in sending activation link. Please check your internet connectivity.');
    }
  }

  Future<void> _resendActivationLink() async {
    final String url = 'http://127.0.0.1:8000/user/resend-activation/';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {'username': _usernameTEC.text},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _showSuccessDialog('Activation link resent successfully.');
      } else {
        _showErrorDialog('Error in sending activation link. Please check your internet connectivity.');
      }
    } catch (e) {
      _showErrorDialog('Error in sending activation link. Please check your internet connectivity.');
    }
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the success dialog
                Navigator.pushNamed(context, '/login'); // Navigate to the login page
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
            'assets/register/background.png',
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
                      "Please fill the options below",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Phone number",
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
                          controller: _phoneTEC,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            color: Colors.white, // Set the text color to white
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                            hintText: "Enter your phone number",
                            hintStyle: TextStyle(
                              color: Colors.white, // Set the hint text color to white
                            ),
                            border: InputBorder.none,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Email address",
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
                          controller: _emailTEC,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            color: Colors.white, // Set the text color to white
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                            hintText: "name@gmail.com",
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
                    onTap: () async {
                      await _registerUser();
                    },
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

                  // Resend Activation Link button
                  if (_isResendActivationEnabled)
                    TextButton(
                      onPressed: () async {
                        await _resendActivationLink();
                      },
                      child: const Text('Resend Activation Link'),
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
