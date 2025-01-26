import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosPage extends StatelessWidget {
  final List<String> videoPaths = [
    'assets/videos/1.mp4',
    'assets/videos/2.mp4',
    'assets/videos/3.mp4',
    'assets/videos/4.mp4',
    'assets/videos/5.mp4',
    'assets/videos/6.mp4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            itemCount: videoPaths.length,
            itemBuilder: (context, index) {
              // Utiliser MediaQuery pour gérer les tailles d'écran
              double screenWidth = MediaQuery.of(context).size.width;
              double videoHeight = screenWidth > 600 ? 400 : 250; // Ajuster la hauteur de la vidéo

              return VideoPlayerItem(
                videoPath: videoPaths[index],
                videoHeight: videoHeight,
              );
            },
          );
        },
      ),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoPath;
  final double videoHeight;

  VideoPlayerItem({required this.videoPath, required this.videoHeight});

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  void _skipVideo() {
    // Skip to the next video (if any)
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // Position de l'ombre
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(
                height: widget.videoHeight,
                color: Colors.black12,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.deepPurple,
                  bufferedColor: Colors.purpleAccent,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_next,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    onPressed: _skipVideo,
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
