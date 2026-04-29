import 'package:flutter/material.dart';
import 'package:solve_the_story/styles.dart';

class MysteriousBackground extends StatelessWidget {
  final Widget child;
  final List<Widget>? topOverlay;

  const MysteriousBackground({
    super.key,
    required this.child,
    this.topOverlay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(gradient: mysteriousGradient),
          ),
          if (topOverlay != null) ...topOverlay!,
          child,
        ],
      ),
    );
  }
}
