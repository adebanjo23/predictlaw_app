import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  static const String routeName = '/upload';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const UploadScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Screen'),
      ),
    );
  }
}
