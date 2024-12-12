import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panic_button App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SoundButtonPage(),
    );
  }
}

class SoundButtonPage extends StatefulWidget {
  @override
  _SoundButtonPageState createState() => _SoundButtonPageState();
}

class _SoundButtonPageState extends State<SoundButtonPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  void _toggleSound() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
    } else {
      await _audioPlayer.play(AssetSource('warning_sound.mp3'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('panic_button Данильчук 31-ІСТ'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            fixedSize: Size(400, 400), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, 
            ),
          ),
          onPressed: _toggleSound,
          child: Text(
            _isPlaying ? 'Stop' : ' ',
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
