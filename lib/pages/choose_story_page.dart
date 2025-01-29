import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:solve_the_story/pages/story_question_page.dart';
import 'package:solve_the_story/providers/audio_provider.dart';
import 'package:solve_the_story/providers/id_provider.dart';
import 'package:solve_the_story/providers/story_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/story_card_button.dart';

class ChooseStoryPage extends StatelessWidget {
  ChooseStoryPage({super.key});
  static String route = '/story/choose_story';

  final List<Color> randomColors = [
    cardBlue,

    cardGreen,
    // cardLeaf,
    cardPink, cardDarkBlue,
    cardNavy
  ];
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final storyProvider = Provider.of<StoryProvider>(context);
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
                    print(idProvider.currentId);
                    if (audioProvider.isPlaying) {
                      audioProvider.pauseMusic();
                    } else {
                      audioProvider.resumeMusic();
                    }
                  },
                );
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(IconlyLight.arrow_left_2),
            color: white1,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Choose your story',
            textAlign: TextAlign.center,
            style: fancyText.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              // this is a start of the page's components
              children: [
                const SizedBox(
                  height: 16,
                ),
                // this is the first card button
                Consumer<IdProvider>(builder: (context, idProvider, child) {
                  return FutureBuilder(
                      future: storyProvider.fetchAllStories(idProvider),
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 100,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.5,
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 0,
                            ),
                            itemCount: storyProvider.allStories.length,
                            itemBuilder: (context, index) {
                              return StoryCardButton(
                                image: "assets/images/object1.png",
                                bgColor: randomColors[int.parse(
                                    storyProvider.allStories[index].color)],
                                text: storyProvider.allStories[index].titleId
                                    .toString(),
                                subText: '15 Stories, about what yaa.',
                                isLocked: false,
                                isDark: true,
                                onTap: () {
                                  Get.to(
                                    () => StoryQuestionPage(
                                      storyIndex:
                                          storyProvider.allStories[index],
                                    ),
                                    transition: Transition.cupertino,
                                    duration: const Duration(
                                      milliseconds: 800,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      });
                }),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
        ));
  }
}
