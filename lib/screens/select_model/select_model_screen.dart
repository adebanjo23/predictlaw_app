import 'package:flutter/material.dart';
import 'package:predictlaw/colors.dart' as color;

class SelectModelScreen extends StatefulWidget {
  const SelectModelScreen({super.key});

  static const String routeName = '/select_model';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SelectModelScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SelectModelScreen> createState() => _SelectModelScreenState();
}

class _SelectModelScreenState extends State<SelectModelScreen> {
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
            Image.asset(
              'assets/register/background.png', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.only(top: 250, left: 30, right: 30),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Please select your preferred LLM",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox( height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBox(
                        imagePath: 'assets/home/2.png',
                        labelText: 'Private LLM',
                        onTap: () {
                          print('Option 1 clicked');
                          Navigator.pushNamed(context, '/home');
                          // Perform the desired function for Option 2

                        },
                      ),
                      _buildBox(
                        imagePath: 'assets/home/2.png',
                        labelText: 'Public LLM',
                        onTap: () {
                          // Perform the desired function for Option 2
                          print('Option 2 clicked');
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    ],
                  ),
                ],
              )

          ),
    ],
        ),
    );
  }

  Widget _buildBox({required String imagePath, required String labelText, required VoidCallback onTap}) {
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
