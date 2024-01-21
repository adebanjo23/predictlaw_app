import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key});

  static const String routeName = '/signin';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SigninScreen(),
      settings: const RouteSettings(name: routeName),
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
            'assets/signin/background.png', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.only(top: 150, left: 30, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Welcome to Predict Law, are you a new user?",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 50, right: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigate to /home when the image is tapped
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Image.asset('assets/signin/1.png'),
                            ),
                            const SizedBox(width: 60,),
                            InkWell(
                              onTap: () {
                                // Navigate to /home when the image is tapped
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Image.asset('assets/signin/2.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
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
