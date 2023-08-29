import 'dart:async';

import 'package:flutter/material.dart';
import 'package:post_it/auth/presentation/auth_screen.dart';
import 'package:post_it/home/presentation/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  @override
  void initState() {
    super.initState();
    token = widget.sharedPreferences.getString('access_token');
    Timer(
      const Duration(seconds: 2),
      () {
        if (token != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => const HomeScreen()),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => const AuthScreen()),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon.png'),
            const SizedBox(
              height: 12,
            ),
            const Text('Post It')
          ],
        ),
      ),
    );
  }
}
