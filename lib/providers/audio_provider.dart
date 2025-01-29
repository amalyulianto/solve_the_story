import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider with ChangeNotifier {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  AudioProvider() {
    _audioPlayer = AudioPlayer();
    playMusic();
  }

  bool get isPlaying => _isPlaying;

  void playMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('audios/bgMusic.mp3'));
    _isPlaying = true;
    notifyListeners();
  }

  void pauseMusic() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resumeMusic() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }
}
