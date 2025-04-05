import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solve_the_story/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Get.offAll(() => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Image.asset(
                'assets/images/logo_alapakadala.png',
                color: Colors.white,
              ),
            ), // Your logo here
          ],
        ),
      ),
    );
  }
}
