import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/styles.dart';

class StoryButton extends StatefulWidget {
  const StoryButton({
    super.key,
    required this.text,
    required this.subText,
    required this.bgColor,
    required this.isLocked,
    required this.isDark,
    required this.emoji,
    required this.onTap,
  });

  final String text;
  final String subText;
  final String emoji;
  final LinearGradient bgColor;
  final bool isLocked;
  final bool isDark;
  final VoidCallback onTap;

  @override
  State<StoryButton> createState() => _StoryButtonState();
}

class _StoryButtonState extends State<StoryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: widget.bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  widget.emoji,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: fancyText.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: widget.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subText,
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isLocked)
                Icon(
                  IconlyBold.lock,
                  color: widget.isDark ? Colors.white : Colors.black,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
