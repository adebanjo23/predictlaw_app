import 'package:flutter/material.dart';
import 'package:predictlaw/colors.dart' as color;

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  static const String routeName = '/home';

  static Route route(String? username) {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(username: username ?? ''), // Use an empty string if username is null
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                // Handle menu icon tap
              },
              child: Image.asset(
                'assets/home/menu.png', // Replace with your image path
                width: 20, // Adjust the width as needed
                height: 20, // Adjust the height as needed
              ),
            ),
          ),
        ],
      ),

      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome ${widget.username}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Please select the one that applies to you ",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox(
                    imagePath: 'assets/home/1.png',
                    labelText: 'Rental law',
                    onTap: () {
                      // Navigate to '/check' when Rental law is clicked
                      Navigator.pushNamed(context, '/check');
                    },
                  ),
                  _buildBox(
                    imagePath: 'assets/home/2.png',
                    labelText: 'General contract',
                    onTap: () {
                      _showNotAvailableDialog();
                    },
                  ),
                  _buildBox(
                    imagePath: 'assets/home/3.png',
                    labelText: 'Family & marriage',
                    onTap: () {
                      _showNotAvailableDialog();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(
                    imagePath: 'assets/home/4.png',
                    labelText: 'Corporate law ',
                    onTap: () {
                      _showNotAvailableDialog();
                    },
                  ),
                  const SizedBox(width: 20),
                  _buildBox(
                    imagePath: 'assets/home/5.png',
                    labelText: 'Labour law',
                    onTap: () {
                      _showNotAvailableDialog();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      backgroundColor: color.AppColor.HomeScreenBackground,
    );
  }

  void _showNotAvailableDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Feature Not Available'),
          content: const Text('Sorry, this feature is not available.'),
          actions: <Widget>[
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

  Widget _buildBox({
    required String imagePath,
    required String labelText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            labelText,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
