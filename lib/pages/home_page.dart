import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:solve_the_story/pages/solve_story_page.dart';
import 'package:solve_the_story/providers/audio_provider.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/button_gradient.dart';
import 'package:solve_the_story/widgets/important_text.dart';
import 'package:solve_the_story/widgets/reusable_text.dart';

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
    // TODO: implement dispose
    WidgetsBinding.instance.addObserver(this);
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);
    audioProvider.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);
    if (state == AppLifecycleState.paused) {
      audioProvider.pauseMusic();
    } else if (state == AppLifecycleState.resumed) {
      audioProvider.resumeMusic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        // title: Text(
        //   'GAME NGOBROL',
        //   style: fancyText.copyWith(
        //       color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        // ),
        actions: <Widget>[
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
              IconlyLight.setting,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/images/logoMark.png'),
              ReusableText(
                  text: 'Solve the story!',
                  size: 28,
                  fontWeight: bold,
                  color: white1,
                  textAlign: TextAlign.center),
              SizedBox(height: 20), // Spacer(),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: black1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.white, width: 1.5))),
                    onPressed: () {
                      Get.to(() => SolveStoryPage(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 800));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: ReusableText(
                        text: 'Play',
                        color: Colors.white,
                        size: 24,
                        textAlign: TextAlign.center,
                        fontWeight: bold,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
