import 'package:flutter/material.dart';
import 'package:solve_the_story/styles.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key,
      required this.text,
      required this.size,
      required this.fontWeight,
      required this.color,
      required this.textAlign,
      this.maxLines = 3});

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: onlyText.copyWith(
          fontSize: size, fontWeight: fontWeight, color: color, height: 1.4),
      maxLines: maxLines,
      softWrap: false,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
