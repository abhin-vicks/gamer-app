import 'package:flutter/material.dart';
import 'package:og_gamers/constants.dart';
import 'package:og_gamers/screens/home.dart';
import 'package:og_gamers/screens/login.dart';
import 'package:og_gamers/services/shared_preference_service.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  bool isLoggedIn() {
    bool isUserLoggedIn;
    isUserLoggedIn = Pref.isEmpty() ? false : Pref.getBool(kIsLoggedIn) as bool;

    return isUserLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn()
        ? HomeScreen(Pref.getString(kUserId)!)
        : const LoginScreen();
  }
}
