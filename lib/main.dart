import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predictlaw/config/app_router.dart';
import 'package:predictlaw/screens/activate/activate_screen.dart';
import 'package:predictlaw/screens/chat/chat_screen.dart';
import 'package:predictlaw/screens/home/home_screen.dart';
import 'package:predictlaw/screens/landing/landing_screen.dart';
import 'package:predictlaw/screens/login/login_screen.dart';
import 'package:predictlaw/screens/register/register_screen.dart';
import 'package:predictlaw/screens/register2/register2_screen.dart';
import 'package:predictlaw/screens/select_model/select_model_screen.dart';
import 'package:predictlaw/screens/signin/signin_screen.dart';
import 'package:predictlaw/screens/check/check_screen.dart';
import 'package:predictlaw/screens/tokenize_card/tokenize_card_screen.dart';
import 'package:predictlaw/screens/upload/upload_screen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: LandingScreen.routeName,
    );
  }
}




