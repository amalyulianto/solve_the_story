import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

class StoryCardButton extends StatelessWidget {
  const StoryCardButton(
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
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: isLocked ? 0.4 : 1.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: bgColor),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: text,
                        size: 16,
                        maxLines: 3,
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.start,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      ReusableText(
                        text: subText,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        size: 12,
                        fontWeight: FontWeight.normal,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      image,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isLocked
              ? Center(
                  child: Icon(
                    IconlyBold.lock,
                    color: white1,
                    size: 50,
                  ),
                )
              : const SizedBox(
                  width: 0,
                ),
        ],
      ),
    );
  }
}
