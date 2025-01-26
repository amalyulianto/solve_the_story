import 'package:flutter/material.dart';
import 'package:solve_the_story/styles.dart';

class ImportantText extends StatelessWidget {
  const ImportantText(
      {super.key,
      required this.text,
      required this.size,
      required this.fontWeight,
      required this.color});

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: onlyText.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: 2,
      softWrap: false,
      textAlign: TextAlign.center,
    );
  }
}
