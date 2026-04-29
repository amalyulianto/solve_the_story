import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solve_the_story/pages/home_page.dart';
import 'package:solve_the_story/styles.dart';

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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: espresso,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: 0.8 + (0.2 * value),
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                'assets/images/logoMark.png',
                height: 150,
              ),
            ),
            const SizedBox(height: 24),
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Text(
                'DARK RIDDLES',
                style: fancyText.copyWith(
                  color: primaryLight,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
