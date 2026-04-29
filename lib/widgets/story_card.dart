import 'package:flutter/material.dart';
import 'package:solve_the_story/styles.dart';

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
      margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentGold.withValues(alpha: 0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            // Subtle texture/gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RawScrollbar(
                thumbVisibility: true,
                thickness: 4,
                radius: const Radius.circular(10),
                thumbColor: accentGold.withValues(alpha: 0.5),
                child: ListView(
                  children: [
                    Text(
                      type.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: onlyText.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                        color: textColor.withValues(alpha: 0.6),
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      image,
                      style: const TextStyle(fontSize: 72),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      title,
                      style: fancyText.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      height: 40,
                      thickness: 1,
                      color: Colors.black12,
                    ),
                    Text(
                      content,
                      textAlign: TextAlign.center,
                      style: onlyText.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                        color: textColor.withValues(alpha: 0.9),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
