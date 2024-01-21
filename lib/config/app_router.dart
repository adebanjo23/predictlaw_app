import 'package:flutter/material.dart';
import 'package:predictlaw/screens/activate/activate_screen.dart';
import 'package:predictlaw/screens/home/home_screen.dart';
import 'package:predictlaw/screens/landing/landing_screen.dart';
import 'package:predictlaw/screens/login/login_screen.dart';
import 'package:predictlaw/screens/register/register_screen.dart';
import 'package:predictlaw/screens/register2/register2_screen.dart';
import 'package:predictlaw/screens/select_model/select_model_screen.dart';
import 'package:predictlaw/screens/signin/signin_screen.dart';
import 'package:predictlaw/screens/chat/chat_screen.dart';
import 'package:predictlaw/screens/tokenize_card/tokenize_card_screen.dart';
import 'package:predictlaw/screens/upload/upload_screen.dart';
import 'package:predictlaw/screens/check/check_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch(settings.name){
      case '/':
        return LandingScreen.route();
      case LandingScreen.routeName:
        return LandingScreen.route();
      case SigninScreen.routeName:
        return SigninScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      case Register2Screen.routeName:
        return Register2Screen.route();
      case HomeScreen.routeName:
        final String? username = settings.arguments as String?;
        return HomeScreen.route(username);
      case ChatScreen.routeName:
        return ChatScreen.route();
      case UploadScreen.routeName:
        return UploadScreen.route();
      case CheckScreen.routeName:
        return CheckScreen.route();
      case SelectModelScreen.routeName:
        return SelectModelScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case ActivateScreen.routeName:
        return ActivateScreen.route();
      case TokenizeCardScreen.routeName:
        return TokenizeCardScreen.route();







      default:
        return _errorRoute();

    }

  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'),),),
      settings: const RouteSettings(name: '/error'),
    );
  }
}