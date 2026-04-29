import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solve_the_story/models/story_model.dart';
import 'package:solve_the_story/pages/story_question_page.dart';
import 'package:solve_the_story/providers/id_provider.dart';
import 'package:solve_the_story/providers/story_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/mysterious_background.dart';
import 'package:solve_the_story/widgets/story_app_bar.dart';
import 'package:solve_the_story/widgets/story_card_button.dart';

class ChooseStoryPage extends StatefulWidget {
  const ChooseStoryPage({super.key});
  static String route = '/story/choose_story';

  @override
  State<ChooseStoryPage> createState() => _ChooseStoryPageState();
}

class _ChooseStoryPageState extends State<ChooseStoryPage> {
  final List<Color> randomColors = [
    espresso,
    charcoal,
    accentOrange.withValues(alpha: 0.8),
    accentGold.withValues(alpha: 0.8),
    const Color(0xff4A1A1A),
    const Color(0xff1A4A4A),
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
    return MysteriousBackground(
      child: SafeArea(
        child: Column(
          children: [
            StoryAppBar(
              title: 'CHOOSE STORY',
              leading: IconButton(
                icon: Icon(IconlyLight.arrow_left_2, color: primaryLight),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: FutureBuilder<void>(
                future: _fetchStoriesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.amber));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return Consumer<StoryProvider>(
                      builder: (context, storyProvider, child) {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 16),
                          child: LayoutGrid(
                            columnSizes: [1.fr, 1.fr],
                            rowSizes: List.generate(
                              (storyProvider.allStories.length / 2).ceil(),
                              (index) => 250.px,
                            ),
                            rowGap: 16,
                            columnGap: 16,
                            children: [
                              for (var i = 0;
                                  i < storyProvider.allStories.length;
                                  i++)
                                StoryCardButton(
                                  isDone:
                                      isStoryDone(storyProvider.allStories[i]),
                                  emoji: storyProvider.allStories[i].emoji,
                                  bgColor: randomColors[int.parse(
                                          storyProvider.allStories[i].color) %
                                      randomColors.length],
                                  text: storyProvider.allStories[i].titleEn
                                      .toString(),
                                  isLocked: false,
                                  isDark: true,
                                  onTap: () {
                                    Get.to(
                                      () => StoryQuestionPage(
                                        storyIndex: i,
                                      ),
                                      transition: Transition.zoom,
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                    );
                                  },
                                )
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
