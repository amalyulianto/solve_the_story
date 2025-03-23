import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solve_the_story/models/story_model.dart';
import 'package:solve_the_story/pages/story_question_page.dart';
import 'package:solve_the_story/providers/audio_provider.dart';
import 'package:solve_the_story/providers/id_provider.dart';
import 'package:solve_the_story/providers/story_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/show_modal_story.dart';
import 'package:solve_the_story/widgets/story_card_button.dart';

class ChooseStoryPage extends StatelessWidget {
  ChooseStoryPage({super.key});
  static String route = '/story/choose_story';

  final List<Color> randomColors = [
    cardBlue,
    cardGreen,
    // cardLeaf,
    cardPink,
    cardDarkBlue,
    cardNavy,
  ];

  Future<List<String>> _loadDoneStories() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('doneStories') ?? [];
  }

  bool isStoryDone(Story story, List<String> doneStoriesJson) {
    String storyJson = jsonEncode(story.toJson());
    return doneStoriesJson.contains(storyJson);
  }

  @override
  Widget build(BuildContext context) {
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
            'Choose your story',
            textAlign: TextAlign.center,
            style: fancyText.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: FutureBuilder(
            future: _loadDoneStories(),
            builder: (context, doneStoriesSnapshot) {
              if (doneStoriesSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (doneStoriesSnapshot.hasError) {
                return Center(
                    child: Text('Error: ${doneStoriesSnapshot.error}'));
              } else {
                final doneStoriesJson = doneStoriesSnapshot.data ?? [];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    // this is a start of the page's components
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      // this is the first card button
                      Consumer2<StoryProvider, IdProvider>(
                          builder: (context, storyProvider, idProvider, child) {
                        return FutureBuilder(
                            future: storyProvider
                                .fetchAllStories(idProvider.currentId),
                            builder: (context, snapshot) {
                              return SizedBox(
                                height: 250,
                                child: GridView.builder(
                                  padding: EdgeInsets.all(8),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1,
                                    crossAxisCount: 2,
                                    // crossAxisSpacing: 8,
                                    mainAxisSpacing: 4,
                                  ),
                                  itemCount: storyProvider.allStories.length,
                                  itemBuilder: (context, index) {
                                    final story =
                                        storyProvider.allStories[index];
                                    final done =
                                        isStoryDone(story, doneStoriesJson);
                                    return StoryCardButton(
                                      isDone: done,
                                      image: "assets/images/object1.png",
                                      bgColor: randomColors[int.parse(
                                          storyProvider
                                              .allStories[index].color)],
                                      text: storyProvider
                                          .allStories[index].titleEn
                                          .toString(),
                                      subText: '15 Stories, about what yaa.',
                                      isLocked: false,
                                      isDark: true,
                                      onTap: () {
                                        Get.to(
                                          () => StoryQuestionPage(
                                            storyIndex: index,
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
                );
              }
            }));
  }
}
