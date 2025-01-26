import 'package:flutter/material.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/important_text.dart';

class ButtonGradient extends StatelessWidget {
  const ButtonGradient(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.gradient,
      required this.onTap});

  final String text;
  final Color bgColor;
  final LinearGradient gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: bgColor,
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ImportantText(
                text: text,
                size: 22,
                fontWeight: bold,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                child: const ImportantText(
                  text: 'MAIN',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  size: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
