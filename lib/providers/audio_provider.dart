import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider with ChangeNotifier {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  final double _volume = 0.5; // Default volume level

  AudioProvider() {
    _audioPlayer = AudioPlayer();
    playMusic();
  }

  bool get isPlaying => _isPlaying;

  void playMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.setVolume(_volume);
    await _audioPlayer.play(AssetSource('audios/theme.mp3'));
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
