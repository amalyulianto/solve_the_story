import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

class StoryButton extends StatelessWidget {
  const StoryButton(
      {super.key,
      required this.text,
      required this.subText,
      required this.bgColor,
      required this.isLocked,
      required this.isDark,
      required this.emoji,
      required this.onTap});
  final String text;
  final String subText;
  final String emoji;
  final LinearGradient bgColor;
  final bool isLocked;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: onTap,
      child: Container(
        // height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), gradient: bgColor),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: emoji,
                    size: 64,
                    fontWeight: bold,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ReusableText(
                    text: text,
                    size: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ReusableText(
                    text: subText,
                    textAlign: TextAlign.start,
                    size: 16,
                    fontWeight: FontWeight.normal,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ],
              ),
            ),
            isLocked
                ? SizedBox(
                    child: Icon(
                      IconlyBold.lock,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  )
                : const SizedBox(
                    width: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
