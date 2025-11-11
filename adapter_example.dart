/// Adapter Design Pattern Example
/// 
/// The Adapter pattern allows incompatible interfaces to work together
/// by wrapping an object with an adapter to make it compatible with another class.

// Target interface
abstract class MediaPlayer {
  void play(String audioType, String fileName);
}

// Adaptee - Advanced media player
abstract class AdvancedMediaPlayer {
  void playVlc(String fileName);
  void playMp4(String fileName);
}

class VlcPlayer implements AdvancedMediaPlayer {
  @override
  void playVlc(String fileName) {
    print('Playing vlc file: $fileName');
  }

  @override
  void playMp4(String fileName) {
    // Do nothing
  }
}

class Mp4Player implements AdvancedMediaPlayer {
  @override
  void playVlc(String fileName) {
    // Do nothing
  }

  @override
  void playMp4(String fileName) {
    print('Playing mp4 file: $fileName');
  }
}

// Adapter
class MediaAdapter implements MediaPlayer {
  late AdvancedMediaPlayer advancedMediaPlayer;

  MediaAdapter(String audioType) {
    if (audioType == 'vlc') {
      advancedMediaPlayer = VlcPlayer();
    } else if (audioType == 'mp4') {
      advancedMediaPlayer = Mp4Player();
    }
  }

  @override
  void play(String audioType, String fileName) {
    if (audioType == 'vlc') {
      advancedMediaPlayer.playVlc(fileName);
    } else if (audioType == 'mp4') {
      advancedMediaPlayer.playMp4(fileName);
    }
  }
}

// Concrete MediaPlayer
class AudioPlayer implements MediaPlayer {
  @override
  void play(String audioType, String fileName) {
    if (audioType == 'mp3') {
      print('Playing mp3 file: $fileName');
    } else if (audioType == 'vlc' || audioType == 'mp4') {
      MediaAdapter mediaAdapter = MediaAdapter(audioType);
      mediaAdapter.play(audioType, fileName);
    } else {
      print('Invalid media type: $audioType');
    }
  }
}

void main() {
  AudioPlayer audioPlayer = AudioPlayer();

  audioPlayer.play('mp3', 'song.mp3');
  audioPlayer.play('mp4', 'video.mp4');
  audioPlayer.play('vlc', 'movie.vlc');
  audioPlayer.play('avi', 'film.avi');
}
