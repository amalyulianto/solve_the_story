import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

class StoryCardButton extends StatelessWidget {
  StoryCardButton(
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
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: isLocked ? 0.4 : 1.0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: bgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ReusableText(
                            text: text,
                            size: 16,
                            maxLines: 3,
                            fontWeight: FontWeight.w900,
                            textAlign: TextAlign.center,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        // Spacer(),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            image,
                            width: 60,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 4, bottom: 8, left: 8, right: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
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
    );
  }
}
