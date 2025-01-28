import 'package:flutter/material.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.bgColor,
    required this.image,
    required this.title,
    required this.content,
    required this.textColor,
    required this.type,
  });

  final Color bgColor;
  final String image;
  final String title;
  final String content;
  final Color textColor;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      // height: 400,
      margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: MediaQuery.of(context).size.width - 24,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RawScrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            ReusableText(
              text: type,
              size: 14,
              fontWeight: FontWeight.normal,
              color: textColor,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(
              height: 12,
            ),
            Image.asset(
              image,
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            ReusableText(
              text: title,
              size: 22,
              fontWeight: FontWeight.normal,
              color: textColor,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              child: ReusableText(
                text: content,
                size: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
                textAlign: TextAlign.center,
                maxLines: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
