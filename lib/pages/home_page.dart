import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:solve_the_story/pages/solve_story_page.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/button_gradient.dart';
import 'package:solve_the_story/widgets/important_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GAME NGOBROL',
          style: fancyText.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              IconlyLight.setting,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Center(
                child: ImportantText(
                  text: 'Pilih Mode',
                  size: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonGradient(
                text: 'Truth or Dare',
                bgColor: blue1,
                gradient: blueGradient,
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonGradient(
                text: 'Bercerita!',
                bgColor: purple1,
                gradient: purpleGradient,
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonGradient(
                text: 'This or That!',
                bgColor: red1,
                gradient: redGradient,
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonGradient(
                text: 'Can You Solve\nThe Story?',
                bgColor: Colors.black,
                gradient: blackGradient,
                onTap: () {
                  Get.to(() => const SolveStoryPage(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 800));
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
