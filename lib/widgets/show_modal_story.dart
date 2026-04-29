import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solve_the_story/styles.dart';

class ShowModalStory extends StatelessWidget {
  ShowModalStory({
    super.key,
  });

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      decoration: BoxDecoration(
        color: espresso,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: primaryLight.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [
                HowToModal(
                  title: 'HOW TO PLAY',
                  icon: IconlyLight.game,
                  text:
                      """This game is played in a group. First, choose a narrator. They will read the story and its solution (keep it a secret!).""",
                ),
                HowToModal(
                  title: 'INVESTIGATE',
                  icon: IconlyLight.search,
                  text:
                      """The rest of the players must ask questions to solve the mystery. The narrator can only answer "Yes", "No", or "Not Relevant".""",
                ),
                HowToModal(
                  title: 'SOLVE IT',
                  icon: IconlyLight.discovery,
                  text:
                      """The narrator guides the game. If stuck, hints can be given. The solution is revealed only when properly guessed!""",
                ),
                HowToModal(
                  title: 'HAVE FUN',
                  icon: IconlyLight.heart,
                  text:
                      """Use your imagination! Some answers are obvious, others are twisted. The goal is to enjoy the mystery together.""",
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: accentGold,
              dotColor: primaryLight.withValues(alpha: 0.2),
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3,
              spacing: 8,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class HowToModal extends StatelessWidget {
  const HowToModal({
    super.key,
    required this.title,
    required this.text,
    this.icon = IconlyLight.heart,
  });

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: accentGold.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: accentGold,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: fancyText.copyWith(
                color: primaryLight,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: TextStyle(
                color: primaryLight.withValues(alpha: 0.7),
                fontSize: 16,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
