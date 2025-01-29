import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

class StoryButton extends StatelessWidget {
  const StoryButton(
      {super.key,
      required this.text,
      required this.subText,
      required this.bgColor,
      required this.image,
      required this.isLocked,
      required this.isDark,
      required this.onTap});
  final String text;
  final String subText;
  final Color bgColor;
  final String image;
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0), color: bgColor),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 04, left: 8, right: 2),
              child: SizedBox(
                width: 60,
                child: Image.asset(
                  image,
                  color: Colors.white,
                ),
              ),
            ),
            const Flexible(
              child: SizedBox(
                width: 12,
              ),
            ),
            Expanded(
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: text,
                    size: 16,
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
                    size: 12,
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
