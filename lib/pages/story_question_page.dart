import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';
import 'package:solve_the_story/widgets/story_card.dart';

class StoryQuestionPage extends StatefulWidget {
  const StoryQuestionPage({super.key});

  @override
  State<StoryQuestionPage> createState() => _StoryQuestionPageState();
}

class _StoryQuestionPageState extends State<StoryQuestionPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        backgroundColor: black1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left_2),
          color: white1,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Solve the story!',
          textAlign: TextAlign.center,
          style: fancyText.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // THIS IS NOT FINSIHED YET. THE PAGEVIEW
          // const SizedBox(
          //   height: 24,
          // ),
          GestureDetector(
            onTap: () {
              if (_status == AnimationStatus.dismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
              child: _animation.value <= 0.5
                  ? const StoryCard(
                      title: 'A story of Scarlet',
                      content: 'Secret recipe of KFC is here',
                      image: 'assets/images/story2.png',
                      bgColor: Colors.white,
                      textColor: Colors.black,
                    )
                  : Transform.scale(
                      scaleX: -1,
                      child: StoryCard(
                        title: 'A story of Scarlet',
                        content: 'Secret recipe of KFC is here',
                        image: 'assets/images/story2.png',
                        bgColor: Colors.black,
                        textColor: Colors.white,
                      ),
                    ),
            ),
          ),
          // this one still get error but it works. to be fixed later
          const SizedBox(
            height: 4,
          ),
          const ReusableText(
            text: 'Tap the card to see answer!',
            size: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.white, width: 1.5)),
              ),
              onPressed: () {
                Navigator.pop(context);
                // if (_status == AnimationStatus.dismissed) {
                //   _controller.forward();
                // } else {
                //   _controller.reverse();
                // }
              },
              child: Text(
                "Done Answering",
                style: onlyText.copyWith(color: Colors.white, fontWeight: bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
