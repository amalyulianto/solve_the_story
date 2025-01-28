import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/pages/choose_story_page.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/show_modal_story.dart';
import 'package:solve_the_story/widgets/story_button.dart';

class SolveStoryPage extends StatelessWidget {
  const SolveStoryPage({super.key});
  static String route = '/story';

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
          actions: [
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
                  image: "assets/images/object1.png",
                  bgColor: red4,
                  text: 'Summer Stories that I want to tell you!',
                  subText: '15 Stories, about what yaa.',
                  isLocked: false,
                  isDark: true,
                  onTap: () {
                    Get.to(() => ChooseStoryPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 800));
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ));
  }
}
