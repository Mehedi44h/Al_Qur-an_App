import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomAudioPlayer extends StatefulWidget {
  final String audioUrl;

  const CustomAudioPlayer({super.key, required this.audioUrl});

  @override
  _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      if (mounted) {
        setState(() {
          _duration = duration;
        });
      }
    });
    _audioPlayer.onPositionChanged.listen((Duration position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });
    _play();
  }

  @override
  void dispose() {
    // Check if the audio player is still valid before stopping and releasing
    if (_audioPlayer.state != PlayerState.stopped) {
      _audioPlayer.stop();
    }
    _audioPlayer.release();
    super.dispose();
  }

  Future<void> _play() async {
    setState(() {
      isLoading = true;
    });
    await _audioPlayer.play(UrlSource(widget.audioUrl));
    setState(() {
      _isPlaying = true;
      isLoading = false;
    });
  }

  Future<void> _pause() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void _seek(Duration duration) {
    _audioPlayer.seek(duration);
  }

  String _formatDuration(Duration duration) {
    return duration.toString().split('.').first.padLeft(8, "0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black.withAlpha(250),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white38, width: 2)),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          _seek(Duration(seconds: _position.inSeconds - 10));
                        },
                      ),
                      IconButton(
                        icon: _isPlaying
                            ? const Icon(
                                Icons.pause,
                                color: Colors.white,
                                size: 40,
                              )
                            : const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              ),
                        onPressed: () {
                          if (_isPlaying) {
                            _pause();
                          } else {
                            _play();
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          _seek(Duration(seconds: _position.inSeconds + 10));
                        },
                      ),
                    ],
                  ),
                  Slider(
                    thumbColor: Colors.white,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.white,
                    value: _position.inSeconds.toDouble(),
                    min: 0.0,
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        _seek(Duration(seconds: value.toInt()));
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(_position),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          _formatDuration(_duration),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
