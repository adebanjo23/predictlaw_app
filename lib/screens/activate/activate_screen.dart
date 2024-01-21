import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({Key? key}) : super(key: key);

  static const String routeName = '/activate';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ActivateScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {
  final TextEditingController _usernameTEC = TextEditingController();

  Future<void> _sendActivationLink() async {
    final username = _usernameTEC.text.trim();

    if (username.isEmpty) {
      _showErrorDialog("Please enter your username.");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/user/resend-activation/"),
        body: {'username': username},
      );

      if (response.statusCode == 200) {
        _showSuccessDialog();
      } else {
        _showErrorDialog("Unable to send activation link, please try again.");
      }
    } catch (e) {
      _showErrorDialog("An error occurred. Please try again.");
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Activation Link Sent"),
          content: const Text("Activation link sent to registered email. Please activate account before logging in."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
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
                      "Activate your account",
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
            ElevatedButton(
              onPressed: _sendActivationLink,
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Background color of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 60,
                child: const Center(
                  child: Text(
                    "Activate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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