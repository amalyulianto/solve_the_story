import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

class ShowModalStory extends StatelessWidget {
  ShowModalStory({
    super.key,
  });

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [
                HowToModal(
                  title: 'How to play!',
                  icon: IconlyLight.game,
                  titleColor: Colors.black,
                  text:
                      """This game is played in group. First, you need to choose a person to act as the narrator. He/she will read the story to the other player.
      
      Tips: Choose the one you think has a good understanding of a story, a storyteller maybe!""",
                  textColor: Colors.black,
                ),
                HowToModal(
                  title: 'Game Instructions',
                  icon: IconlyLight.game,
                  titleColor: Colors.black,
                  text:
                      """The narrator reads the solution, but keep it a secret! Then the rest of the players must ask questions to solve the story. The narrator should only answer "yes", "no", or "not relevant".""",
                  textColor: Colors.black,
                ),
                HowToModal(
                  title: 'Game Instructions',
                  icon: IconlyLight.game,
                  titleColor: Colors.black,
                  text:
                      """Now this is the narrator's role to guide the game! There is only one solution which should only be revealed at the end of the game. If the players can't get it of it is confusing enough, the narrator can help by giving their own interpretation of the story. Hints can be given too if it's a deadlock!""",
                  textColor: Colors.black,
                ),
                HowToModal(
                  title: 'Have fun!',
                  icon: IconlyLight.game,
                  titleColor: Colors.black,
                  text:
                      """Remember, use your imaginations in this game because the answer can either be so obvious, or so unsolvable. The point of the game is just to have fun by solving mystery, so have fun!""",
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: WormEffect(
                activeDotColor: blue1,
                dotColor: Colors.black45,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 4
                // dotWidth: 20,
                ),
          ),
          const SizedBox(
            height: 24,
          ),
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
    required this.textColor,
    required this.titleColor,
    this.icon = IconlyLight.heart,
  });

  final String title;
  final String text;
  final Color textColor;
  final Color titleColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Icon(
              icon,
              color: Colors.black,
              size: 64,
            ),
            ReusableText(
              text: title,
              color: titleColor,
              size: 20,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 8,
            ),
            ReusableText(
              text: text,
              maxLines: 10,
              size: 14,
              fontWeight: FontWeight.normal,
              color: textColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
