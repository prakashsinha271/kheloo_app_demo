import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerSection extends StatefulWidget {
  final String videoUrl;

  VideoPlayerSection({required this.videoUrl});

  @override
  _VideoPlayerSectionState createState() => _VideoPlayerSectionState();
}

class _VideoPlayerSectionState extends State<VideoPlayerSection> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // Ensure the first frame is shown when initialized.
        setState(() {});
      });

    // Start playing the video when the widget is created.
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    // Dispose of the video player controller when the widget is removed from the tree.
    _controller.dispose();
    super.dispose();
  }
}
