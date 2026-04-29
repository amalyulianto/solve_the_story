import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider with ChangeNotifier {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  final double _volume = 0.5; // Default volume level
  bool _hasSource = false;

  AudioProvider() {
    _audioPlayer = AudioPlayer();
  }

  bool get isPlaying => _isPlaying;

  void playMusic() async {
    try {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.setVolume(_volume);
      await _audioPlayer.play(AssetSource('audios/theme.mp3'));
      _isPlaying = true;
      _hasSource = true;
      notifyListeners();
    } catch (e) {
      debugPrint("Error playing music: $e");
    }
  }

  void pauseMusic() async {
    if (!_hasSource) return;
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resumeMusic() async {
    if (!_hasSource) {
      playMusic();
      return;
    }
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void toggleMusic() {
    if (_isPlaying) {
      pauseMusic();
    } else {
      resumeMusic();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
