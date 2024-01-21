import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static const String routeName = '/landing';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LandingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 4 seconds and then navigate to the "/signin" route
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/register2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/landing_screen/landing_page.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
