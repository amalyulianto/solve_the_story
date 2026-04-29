import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:solve_the_story/pages/choose_deck_page.dart';
import 'package:solve_the_story/providers/audio_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/audio_toggle.dart';
import 'package:solve_the_story/widgets/mysterious_background.dart';
import 'package:solve_the_story/widgets/show_modal_story.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);

    audioProvider.playMusic();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);
    if (state == AppLifecycleState.paused) {
      audioProvider.pauseMusic();
    } else if (state == AppLifecycleState.resumed) {
      if (audioProvider.isPlaying) {
        audioProvider.resumeMusic();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);
    return MysteriousBackground(
      topOverlay: [
        Positioned(
          top: -100,
          right: -50,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accentGold.withValues(alpha: 0.05),
            ),
          ),
        ),
        Positioned(
          bottom: -150,
          left: -100,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accentOrange.withValues(alpha: 0.05),
            ),
          ),
        ),
      ],
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const AudioToggle(),
                  IconButton(
                    icon: Icon(IconlyLight.info_circle, color: primaryLight),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ShowModalStory(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Hero(
              tag: 'logo',
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: mysteriousGradient,
                  boxShadow: [
                    BoxShadow(
                      color: accentGold.withValues(alpha: 0.2),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/logoMark.png',
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "DARK RIDDLES",
              style: fancyText.copyWith(
                color: primaryLight,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 6,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "EVERY SHADOW HAS A TALE",
              style: TextStyle(
                color: primaryLight.withValues(alpha: 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w300,
                letterSpacing: 4,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 8,
                    shadowColor: accentOrange.withValues(alpha: 0.4),
                  ),
                  onPressed: () {
                    audioProvider.playMusic();
                    Get.to(() => const ChooseDeckPage(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 600));
                  },
                  child: const Text(
                    "START JOURNEY",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
