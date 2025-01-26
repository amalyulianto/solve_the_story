import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/pages/story_question_page.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/story_card_button.dart';

class ChooseStoryPage extends StatelessWidget {
  const ChooseStoryPage({super.key});
  static String route = '/story/choose_story';
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
                SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: GridView.count(
                    childAspectRatio: 1 / 1.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories',
                        subText: '15 Stories, about what yaa.',
                        isLocked: false,
                        isDark: true,
                        onTap: () {
                          Get.to(
                            () => const StoryQuestionPage(),
                            transition: Transition.cupertino,
                            duration: const Duration(
                              milliseconds: 800,
                            ),
                          );
                        },
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories that I want to tell you!',
                        subText: '15 Stories, about what yaa.',
                        isLocked: true,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories',
                        subText: '15 Stories, about what yaa.',
                        isLocked: false,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories that I want to tell you!',
                        subText: '15 Stories, about what yaa.',
                        isLocked: true,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories',
                        subText: '15 Stories, about what yaa.',
                        isLocked: false,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories that I want to tell you!',
                        subText: '15 Stories, about what yaa.',
                        isLocked: true,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories',
                        subText: '15 Stories, about what yaa.',
                        isLocked: false,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories that I want to tell you!',
                        subText: '15 Stories, about what yaa.',
                        isLocked: true,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories',
                        subText: '15 Stories, about what yaa.',
                        isLocked: false,
                        isDark: true,
                        onTap: () {},
                      ),
                      StoryCardButton(
                        image: "assets/images/story2.png",
                        bgColor: red4,
                        text: 'Summer Stories that I want to tell you!',
                        subText: '15 Stories, about what yaa.',
                        isLocked: true,
                        isDark: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
        ));
  }
}
