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
      required this.onTap,
      required this.isDone});
  final String text;
  final String subText;
  final Color bgColor;
  final String image;
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
                  borderRadius: BorderRadius.circular(0),
                  color: bgColor,
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
                            Spacer(),
                            // SizedBox(height: 16),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                isDone ? 'assets/images/done.png' : image,
                                width: 60,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 4, bottom: 8, left: 8, right: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        border: Border.all(color: bgColor, width: 1),
                      ),
                      child: Text(
                        "Summer Stories",
                        textAlign: TextAlign.right,
                        style: onlyText.copyWith(),
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
      ),
    );
  }
}
