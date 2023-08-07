import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


/// Stateful widget to fetch and then display video content.
class Socilamediaplayer extends StatefulWidget {
  const Socilamediaplayer({super.key});

  @override
  _SocialmediaState createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socilamediaplayer> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );
    _controller.videoPlayerOptions?.webOptions?.allowContextMenu;
    _controller.videoPlayerOptions?.webOptions?.controls.allowFullscreen;
    _controller.videoPlayerOptions?.webOptions?.controls.controlsList;
    _controller.videoPlayerOptions?.webOptions?.controls.enabled;

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _controller.value.size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child:  Chewie(
                controller: _chewieController),
          )
              : Container(),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });

            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }
}