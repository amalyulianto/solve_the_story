import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:solve_the_story/models/story_model.dart';
import 'package:solve_the_story/providers/story_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/mysterious_background.dart';
import 'package:solve_the_story/widgets/story_app_bar.dart';
import 'package:solve_the_story/widgets/story_card.dart';

class StoryQuestionPage extends StatefulWidget {
  const StoryQuestionPage({super.key, required this.storyIndex});

  final int storyIndex;

  @override
  State<StoryQuestionPage> createState() => _StoryQuestionPageState();
}

class _StoryQuestionPageState extends State<StoryQuestionPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  final audioPlayer = AudioPlayer();
  late bool isDone;

  void playSound() {
    final player = AudioPlayer();
    player.play(AssetSource('audios/paper.mp3'));
  }

  Future<void> toggleIsDone(Story story) async {
    final storyProvider = Provider.of<StoryProvider>(context, listen: false);
    await storyProvider.toggleIsDone(story);
    setState(() {
      isDone = story.isDone;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
    final storyProvider = Provider.of<StoryProvider>(context, listen: false);
    final story = storyProvider.allStories[widget.storyIndex];
    isDone = story.isDone;
  }

  @override
  void dispose() {
    _controller.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MysteriousBackground(
      child: SafeArea(
        child: Column(
          children: [
            StoryAppBar(
              title: 'INVESTIGATE',
              leading: IconButton(
                icon: Icon(IconlyLight.arrow_left_2, color: primaryLight),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: Consumer<StoryProvider>(
                builder: (context, storyProvider, child) {
                  final story = storyProvider.allStories[widget.storyIndex];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_status == AnimationStatus.dismissed) {
                            audioPlayer.play(AssetSource('audios/paper.mp3'));
                            _controller.forward();
                          } else {
                            audioPlayer.play(AssetSource('audios/paper.mp3'));
                            _controller.reverse();
                          }
                        },
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform(
                              alignment: FractionalOffset.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.0015)
                                ..rotateY(pi * _animation.value),
                              child: _animation.value <= 0.5
                                  ? StoryCard(
                                      type: 'The Case',
                                      title: story.titleEn,
                                      content: story.questionEn.toString(),
                                      image: story.emoji,
                                      bgColor: espresso,
                                      textColor: primaryLight,
                                    )
                                  : Transform.scale(
                                      scaleX: -1,
                                      child: StoryCard(
                                        type: 'The Solution',
                                        title: story.titleEn.toString(),
                                        content: story.solutionEn.toString(),
                                        image: '📜',
                                        bgColor: accentGold,
                                        textColor: espresso,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _status == AnimationStatus.dismissed
                            ? 'TAP TO REVEAL SOLUTION'
                            : 'TAP TO HIDE SOLUTION',
                        style: TextStyle(
                          color: primaryLight.withValues(alpha: 0.5),
                          fontSize: 12,
                          fontWeight: bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 48),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isDone ? Colors.green : accentOrange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () async {
                              audioPlayer.play(AssetSource('audios/beep.mp3'));
                              await toggleIsDone(story);
                              Navigator.pop(context);
                            },
                            child: Text(
                              isDone ? "MARK AS UNRESOLVED" : "CASE CLOSED",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
