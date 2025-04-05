import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:solve_the_story/pages/choose_story_page.dart';
import 'package:solve_the_story/providers/audio_provider.dart';
import 'package:solve_the_story/providers/id_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/show_modal_story.dart';
import 'package:solve_the_story/widgets/story_button.dart';

class SolveStoryPage extends StatelessWidget {
  const SolveStoryPage({super.key});
  static String route = '/story';

  @override
  Widget build(BuildContext context) {
    final idProvider = Provider.of<IdProvider>(context);
    return Scaffold(
        backgroundColor: black1,
        appBar: AppBar(
          backgroundColor: black1,
          centerTitle: true,
          actions: [
            Consumer<AudioProvider>(
              builder: (context, audioProvider, child) {
                return IconButton(
                  icon: Icon(
                    audioProvider.isPlaying
                        ? IconlyLight.volume_up
                        : IconlyLight.volume_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (audioProvider.isPlaying) {
                      audioProvider.pauseMusic();
                    } else {
                      audioProvider.resumeMusic();
                    }
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(
                IconlyLight.info_circle,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ShowModalStory();
                  },
                );
                // Get.to(() => ShowModalStory());
              },
            )
          ],
          leading: IconButton(
            icon: const Icon(IconlyLight.arrow_left_2),
            color: white1,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Can You Solve\nThe Story?',
            textAlign: TextAlign.center,
            style: fancyText.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              // this is a start of the page's components
              children: [
                const SizedBox(
                  height: 16,
                ),
                // this is the first card button
                StoryButton(
                  emoji: '🤔❓',
                  bgColor: blueGradient,
                  text: 'Normal Deck 1',
                  subText: '23 Stories',
                  isLocked: false,
                  isDark: true,
                  onTap: () {
                    idProvider.setId(1);
                    Get.to(() => ChooseStoryPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 800));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                StoryButton(
                  emoji: '🤔❓',
                  bgColor: purpleGradient,
                  text: 'Normal Deck 2',
                  subText: '15 Stories',
                  isLocked: false,
                  isDark: true,
                  onTap: () {
                    idProvider.setId(2);
                    Get.to(() => ChooseStoryPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 800));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                StoryButton(
                  emoji: '🕵️‍♂️',
                  bgColor: blackGradient,
                  text: 'Detective Deck 1',
                  subText: '15 Stories - Detective Mode!',
                  isLocked: false,
                  isDark: true,
                  onTap: () {
                    idProvider.setId(3);
                    Get.to(() => ChooseStoryPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 800));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                StoryButton(
                  emoji: '🕵️‍♂️',
                  bgColor: redGradient,
                  text: 'Detective Deck 2',
                  subText: '15 Stories - Detective Mode!',
                  isLocked: false,
                  isDark: true,
                  onTap: () {
                    idProvider.setId(4);
                    Get.to(() => ChooseStoryPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 800));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }
}
