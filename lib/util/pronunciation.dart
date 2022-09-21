import 'package:just_audio/just_audio.dart';

class Pronunciation {
  static Pronunciation instance = Pronunciation._init();

  AudioPlayer? audioPlayer;
  Pronunciation._init() {
    audioPlayer ??= AudioPlayer();
  }
  Future<void> playSound(String url) async {
    await audioPlayer!.setUrl(url);
    await audioPlayer!.play();
  }
}
