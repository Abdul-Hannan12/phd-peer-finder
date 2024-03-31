// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phd_peer/core/constants/hive_boxes.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/ui/screens/auth/sign_in/sign_in_screen.dart';

import 'root/root_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (userBox.get('token') != null && userBox.get('token') != '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RootScreen(),
        ),
      );
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          '$logoIconsAssets/splashLogo.png',
        ),
      ),
    );
  }
}
