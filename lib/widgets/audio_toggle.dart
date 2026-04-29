import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:solve_the_story/providers/audio_provider.dart';
import 'package:solve_the_story/styles.dart';

class AudioToggle extends StatelessWidget {
  final Color? color;

  const AudioToggle({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return IconButton(
          icon: Icon(
            audioProvider.isPlaying
                ? IconlyLight.volume_up
                : IconlyLight.volume_off,
            color: color ?? primaryLight,
          ),
          onPressed: () {
            audioProvider.toggleMusic();
          },
        );
      },
    );
  }
}
