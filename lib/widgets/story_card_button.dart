import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

class StoryCardButton extends StatelessWidget {
  const StoryCardButton(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.emoji,
      required this.isLocked,
      required this.isDark,
      required this.onTap,
      required this.isDone});
  final String text;
  final Color bgColor;
  final String emoji;
  final bool isLocked;
  final bool isDark;
  final VoidCallback onTap;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: isLocked ? 0.4 : 1.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bgColor,
                  // border: Border.all(color: Colors.white, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ReusableText(
                                text: text,
                                size: 18,
                                maxLines: 3,
                                fontWeight: FontWeight.w900,
                                textAlign: TextAlign.center,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.center,
                              child: ReusableText(
                                text: emoji,
                                size: 64,
                                fontWeight: bold,
                                color: Colors.white,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
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
            if (isDone)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  // width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      // topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: ReusableText(
                    text: 'Done',
                    size: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
