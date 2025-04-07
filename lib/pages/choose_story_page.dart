import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
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

class ChooseStoryPage extends StatefulWidget {
  const ChooseStoryPage({super.key});
  static String route = '/story/choose_story';

  @override
  State<ChooseStoryPage> createState() => _ChooseStoryPageState();
}

class _ChooseStoryPageState extends State<ChooseStoryPage> {
  final List<Color> randomColors = [
    cardBlue,
    cardGreen,
    // cardLeaf,
    cardPink,
    cardDarkBlue,
    cardNavy,
  ];

  late Future<void> _fetchStoriesFuture;
  late List<String> doneStoriesJson;

  Future<List<String>> _loadDoneStories() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('doneStories') ?? [];
  }

  bool isStoryDone(Story story) {
    String storyJson = jsonEncode(story.toJson());
    return doneStoriesJson.contains(storyJson);
  }

  @override
  void initState() {
    super.initState();
    _fetchStoriesFuture = _initializeStories();
  }

  Future<void> _initializeStories() async {
    final storyProvider = Provider.of<StoryProvider>(context, listen: false);
    final idProvider = Provider.of<IdProvider>(context, listen: false);

    // Fetch done stories
    doneStoriesJson = await _loadDoneStories();

    // Fetch all stories
    await storyProvider.fetchAllStories(idProvider.currentId);
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              child: FutureBuilder<void>(
                future: _fetchStoriesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Consumer<StoryProvider>(
                            builder: (context, storyProvider, child) {
                              return LayoutGrid(
                                columnSizes: [1.fr, 1.fr],
                                rowSizes: List.generate(
                                  (storyProvider.allStories.length / 2).ceil(),
                                  (index) => auto,
                                ),
                                rowGap: 16,
                                columnGap: 16,
                                children: [
                                  for (var i = 0;
                                      i < storyProvider.allStories.length;
                                      i++)
                                    StoryCardButton(
                                      isDone: isStoryDone(
                                          storyProvider.allStories[i]),
                                      emoji: storyProvider.allStories[i].emoji,
                                      bgColor: randomColors[int.parse(
                                          storyProvider.allStories[i].color)],
                                      text: storyProvider.allStories[i].titleEn
                                          .toString(),
                                      isLocked: false,
                                      isDark: true,
                                      onTap: () {
                                        Get.to(
                                          () => StoryQuestionPage(
                                            storyIndex: i,
                                          ),
                                          transition: Transition.cupertino,
                                          duration: const Duration(
                                            milliseconds: 800,
                                          ),
                                        );
                                      },
                                    )
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
