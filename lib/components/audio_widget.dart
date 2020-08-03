import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioWidgetN extends StatefulWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  @override
  Widget build(BuildContext context) {
    return AudioWidget();
  }
}
