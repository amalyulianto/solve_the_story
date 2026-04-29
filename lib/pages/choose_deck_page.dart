import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:solve_the_story/pages/choose_story_page.dart';
import 'package:solve_the_story/providers/id_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/mysterious_background.dart';
import 'package:solve_the_story/widgets/story_app_bar.dart';
import 'package:solve_the_story/widgets/story_button.dart';

class ChooseDeckPage extends StatelessWidget {
  const ChooseDeckPage({super.key});
  static String route = '/story';

  @override
  Widget build(BuildContext context) {
    final idProvider = Provider.of<IdProvider>(context);
    return MysteriousBackground(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            StoryAppBar(
              title: 'CHOOSE DECK',
              isSliver: true,
              leading: IconButton(
                icon: Icon(IconlyLight.arrow_left_2, color: primaryLight),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 10),
                  Text(
                    'Select a world to investigate...',
                    style: TextStyle(
                      color: primaryLight.withValues(alpha: 0.5),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  StoryButton(
                    emoji: '🕵️',
                    bgColor: terracottaGradient,
                    text: 'NORMAL DECK I',
                    subText: '23 Mysterious stories',
                    isLocked: false,
                    isDark: true,
                    onTap: () {
                      idProvider.setId(1);
                      Get.to(() => const ChooseStoryPage(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                  const SizedBox(height: 20),
                  StoryButton(
                    emoji: '🎭',
                    bgColor: midnightTealGradient,
                    text: 'NORMAL DECK II',
                    subText: '15 Intriguing cases',
                    isLocked: false,
                    isDark: true,
                    onTap: () {
                      idProvider.setId(2);
                      Get.to(() => const ChooseStoryPage(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                  const SizedBox(height: 20),
                  StoryButton(
                    emoji: '🔍',
                    bgColor: mysteriousGradient,
                    text: 'DETECTIVE DECK I',
                    subText: '15 High-stakes mysteries',
                    isLocked: false,
                    isDark: true,
                    onTap: () {
                      idProvider.setId(3);
                      Get.to(() => const ChooseStoryPage(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                  const SizedBox(height: 20),
                  StoryButton(
                    emoji: '🩸',
                    bgColor: crimsonGradient,
                    text: 'DETECTIVE DECK II',
                    subText: '15 Dark and twisted tales',
                    isLocked: false,
                    isDark: true,
                    onTap: () {
                      idProvider.setId(4);
                      Get.to(() => const ChooseStoryPage(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                  const SizedBox(height: 40),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
